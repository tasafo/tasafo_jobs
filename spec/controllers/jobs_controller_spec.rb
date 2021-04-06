# frozen_string_literal: true

require 'rails_helper'

describe JobsController do
  fixtures :job_categories
  fixtures :users
  fixtures :jobs

  context 'Return Jobs' do
    it 'with date no expire' do
      get :index

      expect(assigns(:categories).size).to eql(3)
    end

    it 'with all the old works' do
      get :index, params: { old_vacancies: 'checked' }

      expect(assigns(:categories).size).to eql(4)
    end
  end
end
