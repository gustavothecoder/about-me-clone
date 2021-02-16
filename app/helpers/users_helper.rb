# frozen_string_literal: true

module UsersHelper
  def example_users
    User.where(
      "username IN ('luis_gama', 'andre_reboucas', 'jose_do_patrocinio', 'angela_davis')"
    ).map { |user| UserPresenter.new(user) }
  end
end
