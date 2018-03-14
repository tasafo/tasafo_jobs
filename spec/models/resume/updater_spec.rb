require 'rails_helper'

describe Resume::Updater do
  fixtures :resumes
  fixtures :users
  fixtures :settings

  let!(:params) { attrs = resumes(:david).attributes; attrs.delete "id"; attrs }

  it "returns resume" do
    expect(Resume::Updater.new(resumes(:david)).update(params)).to eql resumes(:david)
  end

  context "when resume exists" do
    it "updates resume" do
      params[:title] = "New title"
      Resume::Updater.new(resumes(:david)).update(params)

      expect(resumes(:david).reload.title).to eql "New title"
    end

    it "does not notify new resume" do      
      expect {
        Resume::Updater.new(resumes(:david)).update(params)
      }.to change{ActionMailer::Base.deliveries.count}.by(0)
    end
  end

  context "when resume is new" do
    before do
      users(:david).resume.destroy
    end

    it "saves new resume" do
      expect {
        Resume::Updater.new(users(:david).build_resume).update(params)
      }.to change{Resume.count}.by(1)
    end

    it "notifies new resume" do
      expect {
        Resume::Updater.new(users(:david).build_resume).update(params)
      }.to change{ActionMailer::Base.deliveries.count}.by(1)
    end

    context "when save fails" do
      it "does not notify new resume" do
        params.delete "name"

        expect {
          Resume::Updater.new(users(:david).build_resume).update(params)
        }.to change{ActionMailer::Base.deliveries.count}.by(0)
      end
    end
  end
end