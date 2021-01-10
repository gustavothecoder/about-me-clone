# frozen_string_literal: true

module UsersHelper
  def full_name(user)
    "#{user.first_name.capitalize} #{user.last_name.capitalize}"
  end

  def occupations_text(user)
    last_index = user.occupations.count - 1
    text = ''
    user.occupations.each_with_index do |occupation, index|
      text += text_for(occupation, index, last_index)
    end
    "#{text} in #{user.location}"
  end

  def get_user_reason(user)
    user.user_reason.reason.reason
  end

  def user_website(user)
    user.user_reason.website
  end

  def user_summary(user)
    "Greetings, I'm #{user.first_name}. I'm a #{user.occupations.first.name} livin in #{user.location}." \
    "I am a fan of #{join_interests(user)}. You can #{get_user_reason(user)} with a click on the button above."
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

  def join_interests(user)
    last_index = user.interests.count - 1
    text = ''
    user.interests.each_with_index do |interest, index|
      text += text_for(interest, index, last_index)
    end
    text
  end
end
