# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def next_signup_step
    @step = params[:step]
    @reason = Reason.find(params[:reason]) if @step == '7'
    check_that_the_data_sent_is_already_in_use
    respond_to do |format|
      format.js
    end
  end

  private

  def check_that_the_data_sent_is_already_in_use
    @step = 'email in use' if User.find_by_email(params[:email]).present?
    @step = 'username in use' if User.find_by_username(params[:username]).present?
  end
end
