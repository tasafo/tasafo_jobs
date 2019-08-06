# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  before do
    programming = JobCategory.find_or_create_by(
      name: I18n.t('categories.programming')
    )

    david = User.create_with(password: '12345678',
                             password_confirmation: '12345678').find_or_create_by!(email: 'david@mail.com')

    @job = Job.create!(company_name: 'google', site_url: '', title: 'Vaga de estagio',
                       description: 'vaga para estagiarios',
                       contact_message: 'leve roupa',
                       location: 'perto do lider', category: programming,
                       user: david, days_to_expire: 40)

    @job_expired = Job.create!(company_name: 'microsoft', site_url: '',
                               title: 'Trampo',
                               description: 'vaga para sistema de informacao',
                               contact_message: 'documentos',
                               location: 'bairro proximo', category: programming,
                               user: david, days_to_expire: 0)
  end

  describe 'return current jobs' do
    it 'params false' do
      get :index, params: { jobs: nil }

      expect(@job.days_to_expire).to eq(40)
    end
  end

  describe 'return older jobs' do
    it 'params true' do
      get :index, params: { jobs: 'checked' }

      expect(@job_expired.days_to_expire).to eq(0)
    end
  end
end
