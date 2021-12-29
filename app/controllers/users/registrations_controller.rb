# frozen_string_literal: true

module Users
  class RegistrationsController < ApplicationController
    def new
      if session[:registration_params]
        @valid = session[:registration_params]['valid']
        @current_step = [session[:registration_params]['step'].to_i,  1].max
        @reason = Reason.find(session[:registration_params]['reason'].first) if @current_step == 7
      else
        @valid = true
        @current_step = 1
      end
    end

    def create
      session[:registration_params] = {} if session[:registration_params].nil?
      if Users::Registration::FormValidator.valid?(params: user_params)
        store_user_params
      else
        session[:registration_params]['valid'] = false
      end
      redirect_to new_users_registration_path
    end

    private

    def user_params
      params.permit(
        :step, :email, :first_name, :last_name, :location, :reason, :website,
        :photo, :layout, :color, :username, :password, :password_confirmation,
        :items_type, items: []
      )
    end

    def store_user_params
      new_params = session[:registration_params].merge(user_params)
      new_params['valid'] = true
      new_params['photo_signed_id'] = create_photo_blob(photo: new_params['photo']) if new_params['step'] == '9'
      new_items_key = new_params['items_type']
      new_params[new_items_key] = new_params.delete('items') unless new_items_key.nil?
      new_params.delete('items_type')
      session[:registration_params] = new_params
    end

    def create_photo_blob(photo:)
      ActiveStorage::Blob.create_and_upload!(
        io: photo,
        filename: photo.original_filename,
        content_type: photo.content_type,
        identify: false
      ).signed_id
    end
  end
end
