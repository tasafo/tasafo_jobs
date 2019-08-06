# frozen_string_literal: true

# Tests for jobs_spec
require 'rails_helper'

describe Job do
  fixtures :users
  fixtures :settings
  fixtures :jobs

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:company_name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:contact_message) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:user) }

    it { should allow_value('').for(:site_url) }
    it { should_not allow_value('is not a url').for(:site_url) }
  end

  describe 'scopes' do
    describe 'owned_by user' do
      it 'returns jobs owned by user' do
        expect(Job.owned_by(users(:david))).to include jobs(:ruby)
      end

      it 'does not return jobs that are not owned by user' do
        expect(Job.owned_by(users(:david))).to_not include jobs(:designer)
      end
    end
  end
end
