# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def next_signup_step
    @step = params[:step]
    respond_to do |format|
      format.js
    end
  end
end
