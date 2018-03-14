require 'rails_helper'

describe Job::Creator do
  fixtures :jobs
  fixtures :users
  fixtures :settings
  fixtures :job_categories

  let(:params) { attrs = jobs(:ruby).attributes; attrs.delete "id"; attrs }

  it "creates a new job" do
    expect {
      Job::Creator.new.create(params)
    }.to change{Job.count}.by(1)
  end

  it "returns created job" do
    expect(Job::Creator.new.create(params)).to be_kind_of Job
  end

  context "when job is created" do
    it "delivers new job notification email to all users" do
      ActionMailer::Base.deliveries = []
      expect {
        Job::Creator.new.create(params)
      }.to change{ActionMailer::Base.deliveries.count}.by(1)
    end
  end

  context "when job is not saved" do
    let(:invalid_params) { params["user"] = nil; params }

    it "does not deliver new job notification email to all users" do
      expect {
        Job::Creator.new.create(invalid_params)
      }.to change{ActionMailer::Base.deliveries.count}.by(0)
    end
  end
end