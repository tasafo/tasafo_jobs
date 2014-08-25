require "spec_helper"

describe Notifier do
  fixtures :users
  fixtures :jobs
  fixtures :settings
  fixtures :resumes

  let(:notifier) { Notifier.new }

  describe "#new_job" do
    it "returns notifier" do
      expect(notifier.new_job(jobs :ruby)).to eql(notifier)
    end

    it "returns emails to be delivered to users who allows to receive new jobs notifications" do
      emails = notifier.new_job(jobs :ruby).emails

      expect(emails.size).to eql(1)
      expect(emails.first.to).to include(users(:maria).email)

      emails.each do |email|
        expect(email).to be_kind_of Mail::Message
      end
    end

    it "does not return emails to job owner" do
      notifier.new_job(jobs :ruby).emails.each do |email|
        expect(email.to).to_not include(users(:david).email)
      end
    end
  end

  describe "#new_resume" do
    it "returns notifier" do
      expect(notifier.new_resume(resumes :david)).to eql(notifier)
    end

    it "returns emails to be delivered to users who allows to receive new resumes notifications" do
      emails = notifier.new_resume(resumes :david).emails

      expect(emails.size).to eql(1)
      expect(emails.first.to).to include(users(:maria).email)

      emails.each do |email|
        expect(email).to be_kind_of Mail::Message
      end
    end

    it "does not return emails to job owner" do
      notifier.new_resume(resumes :david).emails.each do |email|
        expect(email.to).to_not include(users(:david).email)
      end
    end
  end

  describe "#notify" do
    it "delivers new job notification email to all users" do
      emails = User.all.map do |recipient|
        JobMailer.new_job(jobs(:ruby), recipient)
      end

      notifier.emails << emails
      notifier.emails.flatten!
     
      expect {
        notifier.notify
      }.to change{ActionMailer::Base.deliveries.size}.by(User.count)
    end
  end
end