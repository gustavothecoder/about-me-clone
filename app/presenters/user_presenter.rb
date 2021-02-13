# frozen_string_literal: true

class UserPresenter < BasePresenter
  def initialize(user)
    super(user)
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def occupations_text
    last_index = occupations.count - 1
    text = ''
    occupations.each_with_index do |occupation, index|
      text += text_for(occupation, index, last_index)
    end
    "#{text} in #{location}"
  end

  def reason
    user_reason.reason.name
  end

  def website
    user_reason.website
  end

  def summary
    "Greetings, I'm #{first_name}. I'm a #{occupations.first.name} livin in #{location}." \
    " I am a fan of #{join_interests}. You can #{reason} with a click on the button above."
  end

  private

  def text_for(object, object_index, last_index)
    if object_index.zero?
      object.name
    elsif object_index < last_index
      ", #{object.name}"
    else
      ", and #{object.name}"
    end
  end

  def join_interests
    last_index = interests.count - 1
    text = ''
    interests.each_with_index do |interest, index|
      text += text_for(interest, index, last_index)
    end
    text
  end
end
