# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    user = User.find_by_username(params[:username])
    @user = Users::Presenter.new(user)
    redirect_to root_path if @user.blank?
  end

  def create
    if Users::Create.call(session[:registration_params])
      redirect_to "/#{session[:registration_params]['username']}"
    else
      redirect_to users_registrations_path, alert: 'Your page cannot be created'
    end
  ensure
    session.delete(:registration_params)
  end
end
