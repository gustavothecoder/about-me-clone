# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def next_signup_step
    @step = params[:step]
    @reason = Reason.find(params[:reason]) if @step == '7'
    @step = 'email in use' if User.find_by_email(params[:email]).present?
    respond_to do |format|
      format.js
    end
  end
end
