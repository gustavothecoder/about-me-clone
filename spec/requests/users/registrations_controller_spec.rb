# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :request do
  let(:params) do
    {
      'step' => '11',
      'email' => 'gxh@email.com',
      'first_name' => 'Gustavo',
      'last_name' => 'Ribeiro',
      'location' => 'Brazil',
      'items' => %w[1 2 3],
      'items_type' => 'interests',
      'layout' => '1',
      'color' => '1',
      'username' => 'gxh',
      'password' => '123456a',
      'password_confirmation' => '123456a'
    }
  end

  describe 'GET new' do
    context 'when the registration_params already exist' do
      it 'renders the new template with the stored current_step' do
        allow_any_instance_of(
          ActionDispatch::Request::Session
        ).to receive(:[]).with(any_args)
        allow_any_instance_of(
          ActionDispatch::Request::Session
        ).to receive(:[]).with(:registration_params).and_return(params)

        get new_users_registration_path

        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
        expect(assigns[:current_step]).to eq(params['step'].to_i)
      end
    end

    context 'when the registration_params do not yet exist' do
      it 'renders the new template with the first form step' do
        get new_users_registration_path

        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
        expect(assigns[:current_step]).to eq(1)
      end
    end
  end

  describe 'POST create' do
    context 'when params are valid' do
      it 'store the sent params and redirect to the new_users_registration_path' do
        post users_registrations_path, params: params

        expect(session[:registration_params]).to eq({
          'step' => '11',
          'email' => 'gxh@email.com',
          'first_name' => 'Gustavo',
          'last_name' => 'Ribeiro',
          'location' => 'Brazil',
          'interests' => %w[1 2 3],
          'layout' => '1',
          'color' => '1',
          'username' => 'gxh',
          'password' => '123456a',
          'password_confirmation' => '123456a'
        })
        expect(response).to redirect_to(new_users_registration_path)
      end
    end

    context 'when params are not valid' do
      it 'does not store the sent params and redirect to new_users_registration_path' do
        last_interest_id = Interest.last.id
        params['step'] = '5'
        params['items'] = %W[#{last_interest_id + 1} #{last_interest_id + 2} #{last_interest_id + 3}]

        post users_registrations_path, params: params

        expect(session[:registration_params]).to eq({
          'valid' => false
        })
        expect(response).to redirect_to(new_users_registration_path)
      end
    end
  end
end
