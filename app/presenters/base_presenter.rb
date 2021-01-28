# frozen_string_literal: true

class BasePresenter < SimpleDelegator
  def initialize(object)
    super(object)
  end

  private

  def helpers
    ApplicationController.helpers
  end
end
