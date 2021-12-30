# frozen_string_literal: true

class Users::ExamplesController < ApplicationController
  def index
    @examples = User.where(
      "username IN ('luis_gama', 'andre_reboucas', 'jose_do_patrocinio', 'angela_davis')"
    ).map { |user| Users::Presenter.new(user) }
  end
end
