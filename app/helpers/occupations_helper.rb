# frozen_string_literal: true

module OccupationsHelper
  def occupation_list
    content_tag(:ul, class: 'w-100 d-flex justify-content-center flex-wrap overflow-auto px-1') do
      Occupation.pluck(:id, :name).each do |occupation|
        concat(occupation_li(occupation))
      end
    end
  end

  private

  def occupation_li(occupation)
    content_tag(
      :li,
      occupation[1],
      value: occupation[0],
      class: 'select-button btn btn-outline-primary my-1 ml-1',
      'item-to-select' => ''
    )
  end
end
