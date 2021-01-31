# frozen_string_literal: true

module InterestsHelper
  def interest_list
    content_tag(:ul, class: 'w-100 d-flex justify-content-center flex-wrap overflow-auto px-1') do
      Interest.pluck(:id, :name).each do |interest|
        concat(interest_li(interest))
      end
    end
  end

  private

  def interest_li(interest)
    content_tag(
      :li,
      interest[1],
      value: interest[0],
      class: 'select-button btn btn-outline-primary my-1 ml-1',
      'item-to-select' => ''
    )
  end
end
