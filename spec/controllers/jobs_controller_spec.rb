# frozen_string_literal: true

require 'rails_helper'

describe JobsController, type: :controller do
  fixtures :job_categories
  fixtures :users
  fixtures :jobs

  let(:job) { jobs(:designer, :ruby, :programmer, :front_end) }

  describe 'Return Jobs' do
    it 'All jobs created' do
      expect(job.count).to eql(4)
    end
  end
end
