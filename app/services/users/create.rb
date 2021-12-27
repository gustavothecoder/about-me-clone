# frozen_string_literal: true

module Users
  class Create
    def initialize(params)
      @params = params
    end

    def self.call(params)
      new(params).call
    end

    def call
      create_user_and_their_relationships
    end

    private

    def create_user_and_their_relationships
      ActiveRecord::Base.transaction do
        user_id = create_user.id
        create_user_relationships(user_id)
      end
      true
    rescue StandardError
      false
    end

    def create_user
      user = User.new(
        @params.slice(
          'email', 'first_name', 'last_name', 'location', 'username', 'password', 'password_confirmation'
        )
      )
      user.photo.attach(ActiveStorage::Blob.find_signed(@params['photo_signed_id']))
      user.save! ? user : nil
    end

    def create_user_relationships(user_id)
      create_user_interests(user_id)
      create_user_occupations(user_id)
      create_user_reason(user_id)
      create_user_page_design(user_id)
    end

    def create_user_interests(user_id)
      interest_ids = @params['interests'].map(&:to_i)
      interest_ids.each do |interest_id|
        UserInterest.create!(user_id: user_id, interest_id: interest_id)
      end
    end

    def create_user_occupations(user_id)
      occupation_ids = @params['occupations'].map(&:to_i)
      occupation_ids.each do |occupation_id|
        UserOccupation.create!(user_id: user_id, occupation_id: occupation_id)
      end
    end

    def create_user_reason(user_id)
      UserReason.create!(user_id: user_id, reason_id: @params['reason'][0], website: @params['website'])
    end

    def create_user_page_design(user_id)
      UserPageDesign.create!(user_id: user_id, design: @params['layout'].to_i, color: @params['color'].to_i)
    end
  end
end
