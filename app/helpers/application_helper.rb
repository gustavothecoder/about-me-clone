# frozen_string_literal: true

module ApplicationHelper
  REGISTRATION_STEPS = %w[
    zero one two three four five six seven eight nine ten eleven
  ].freeze

  def selection_list_of(relation)
    content_tag(:ul, class: 'w-100 d-flex justify-content-center flex-wrap overflow-auto px-1') do
      relation.pluck(:id, :name).each do |object|
        concat(li_of(object))
      end
    end
  end

  def registration_step(step:)
    REGISTRATION_STEPS[step]
  end

  private

  def li_of(object)
    content_tag(
      :li,
      object[1],
      value: object[0],
      class: 'select-button btn btn-outline-primary my-1 ml-1',
      'item-to-select' => ''
    )
  end
end
