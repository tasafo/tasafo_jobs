require "spec_helper"

describe Notifier do
  fixtures :users
  fixtures :jobs

  let(:notifier) { Notifier.new }

  describe "#new_job" do
    it "returns notifier" do
      expect(notifier.new_job(jobs :ruby)).to eql(notifier)
    end

    it "returns emails to be delivered to other users" do
      emails = notifier.new_job(jobs :ruby).emails

      expect(emails.size).to eql(User.count - 1)

      emails.each do |email|
        expect(email).to be_kind_of Mail::Message
      end
    end

    it "does not return emails to job owner" do
      notifier.new_job(jobs :ruby).emails.each do |email|
        expect(email.to).to_not include(jobs(:ruby).user.email)
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