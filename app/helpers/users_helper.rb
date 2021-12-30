# frozen_string_literal: true

module UsersHelper
  REGISTRATION_STEPS = %w[
    zero one two three four five six seven eight nine ten eleven
  ].freeze

  def registration_step(step:)
    REGISTRATION_STEPS[step]
  end
end
