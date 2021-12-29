# frozen_string_literal: true

module UsersHelper
  REGISTRATION_STEPS = %w[
    zero one two three four five six seven eight nine ten eleven
  ].freeze

  def example_users
    User.where(
      "username IN ('luis_gama', 'andre_reboucas', 'jose_do_patrocinio', 'angela_davis')"
    ).map { |user| UserPresenter.new(user) }
  end

  def registration_step(step:)
    REGISTRATION_STEPS[step]
  end
end
