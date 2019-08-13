# frozen_string_literal: true

require 'rails_helper'

describe JobsController, type: :controller do
  fixtures :job_categories
  fixtures :users
  fixtures :jobs

  let(:job) { jobs(:designer, :ruby, :programmer, :front_end) }
  let(:date_now) { Date.today }

  context 'Return Jobs' do
    it 'created' do
      expect(job.count).to eql(4)
    end

    it 'with date no expire' do
      expect(jobs(:ruby).expire_at).to be >= Date.parse(date_now.to_s)
      expect(jobs(:programmer).expire_at).to be >= Date.parse(date_now.to_s)
    end

    it 'where date this expired' do
      expect(jobs(:designer).expire_at).to be < Date.parse(date_now.to_s)
      expect(jobs(:front_end).expire_at).to be < Date.parse(date_now.to_s)
    end
  end
end
