require 'rails_helper'

describe Resume do
  fixtures :resumes

  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }

    it { should allow_value("").for(:linked_in_url) }
    it { should_not allow_value("is not a url").for(:linked_in_url) }
    it { should allow_value("").for(:site_url) }
    it { should_not allow_value("is not a url").for(:site_url) }
    it { should allow_value("").for(:google_plus_url) }
    it { should_not allow_value("is not a url").for(:google_plus_url) }
    it { should allow_value("").for(:twitter_url) }
    it { should_not allow_value("is not a url").for(:twitter_url) }
    it { should allow_value("").for(:facebook_url) }
    it { should_not allow_value("is not a url").for(:facebook_url) }
  end

  describe "scopes" do
    describe "listed" do
      it "returns listed resumes" do
        expect(Resume.listed).to include resumes(:david)
      end

      it "does not return return resumes that are not listed" do
        expect(Resume.listed).to_not include resumes(:maria)
      end
    end
  end
end
