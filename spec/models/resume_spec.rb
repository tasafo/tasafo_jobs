require 'spec_helper'

describe Resume do
  fixtures :resumes

  describe "Validations" do
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
