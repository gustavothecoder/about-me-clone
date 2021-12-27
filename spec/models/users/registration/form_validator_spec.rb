# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::Registration::FormValidator do
  context 'when everything is ok' do
    it 'returns true' do
      %w[1 2 3 4 5 6 7 8 9 10].each do |step|
        result = described_class.valid?(
          params: {
            'step' => step,
            'email' => 'gxh@email.com',
            'first_name' => 'Gustavo',
            'last_name' => 'Ribeiro',
            'location' => 'Brazil',
            'items' => ['1', '2', '3'],
            'reason' => ['1'],
            'website' => 'website.com',
            'photo' => Rack::Test::UploadedFile.new('public/andre_reboucas.jpg'),
            'layout' => '1',
            'color' => '1',
            'username' => 'gxh',
            'password' => '123456a',
            'password_confirmation' => '123456a'
          }
        )

        expect(result).to be_truthy
      end
    end
  end

  context 'when the email is already in use' do
    it 'returns false' do
      create(:user, email: 'gxh@email.com')

      result = described_class.valid?(
        params: {
          'step' => '2',
          'email' => 'gxh@email.com'
        }
      )

      expect(result).to be_falsey
    end
  end

  context 'when the interests does not exist' do
    it 'returns false' do
      last_interest_id = Interest.last.id

      result = described_class.valid?(
        params: {
          'step' => '5',
          'items' => [(last_interest_id + 1).to_s, (last_interest_id + 2).to_s, (last_interest_id + 3).to_s]
        }
      )

      expect(result).to be_falsey
    end
  end

  context 'when the occupations does not exist' do
    it 'returns false' do
      last_occupation_id = Occupation.last.id

      result = described_class.valid?(
        params: {
          'step' => '6',
          'items' => [(last_occupation_id + 1).to_s, (last_occupation_id + 2).to_s, '1']
        }
      )

      expect(result).to be_falsey
    end
  end

  context 'when the reason does not exist' do
    it 'returns false' do
      last_reason_id = Reason.last.id

      result = described_class.valid?(
        params: {
          'step' => '7',
          'items' => [(last_reason_id + 1).to_s]
        }
      )

      expect(result).to be_falsey
    end
  end

  context 'when the layout does not exist' do
    it 'returns false' do
      last_layout_value = UserPageDesign.designs.values.last

      result = described_class.valid?(
        params: {
          'step' => '10',
          'layout' => (last_layout_value + 1).to_s
        }
      )

      expect(result).to be_falsey
    end
  end

  context 'when the color does not exist' do
    it 'returns false' do
      last_color_value = UserPageDesign.colors.values.last

      result = described_class.valid?(
        params: {
          'step' => '10',
          'color' => (last_color_value + 1).to_s
        }
      )

      expect(result).to be_falsey
    end
  end

  context 'when the username is already in use' do
    it 'returns false' do
      create(:user, username: 'gxh')

      result = described_class.valid?(
        params: {
          'step' => '11',
          'username' => 'gxh'
        }
      )

      expect(result).to be_falsey
    end
  end
end
