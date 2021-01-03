# frozen_string_literal: true

module Users
  class Create
    def initialize(params)
      @params = params
    end

    def self.call(params)
      new(params).create_user_and_their_relationships
    end

    def create_user_and_their_relationships
      ActiveRecord::Base.transaction do
        user_id = create_user&.id
        if user_id.present?
          create_user_interests(user_id)
          create_user_occupations(user_id)
          create_user_reason(user_id)
          create_user_page_design(user_id)
        end
      end
      User.find_by_email(@params[:email]).present?
    end

    private

    def create_user
      photo = decode_photo_base64
      user = User.new(
        @params.slice(:email, :first_name, :last_name, :location, :username, :password, :password_confirmation)
      )
      user.photo.attach(photo)
      user.save ? user : nil
    end

    def decode_photo_base64
      ActiveStorage::Blob.create_after_upload!(
        io: StringIO.new(Base64.decode64(@params[:photo].split(',')[1])),
        filename: "#{@params[:username]}.png",
        content_type: 'image/png'
      )
    end

    def create_user_interests(user_id)
      interest_ids = @params[:user_interests].split(',').map(&:to_i)
      interest_ids.each do |interest_id|
        UserInterest.create(user_id: user_id, interest_id: interest_id)
      end
    end

    def create_user_occupations(user_id)
      occupation_ids = @params[:user_occupations].split(',').map(&:to_i)
      occupation_ids.each do |occupation_id|
        UserOccupation.create(user_id: user_id, occupation_id: occupation_id)
      end
    end

    def create_user_reason(user_id)
      UserReason.create(user_id: user_id, reason_id: @params[:user_reason], website: @params[:website])
    end

    def create_user_page_design(user_id)
      UserPageDesign.create(user_id: user_id, design: @params[:layout].to_i, color: @params[:color].to_i)
    end
  end
end
