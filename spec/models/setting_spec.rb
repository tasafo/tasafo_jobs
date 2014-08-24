require "spec_helper"

describe Setting do
  fixtures :settings

  describe "scopes" do
    describe "new jobs" do
      it "returns settings of who allows new job notifications" do
        expect(Setting.new_jobs).to include settings(:david)
        expect(Setting.new_jobs).to include settings(:maria)
      end

      it "does not return settings of who disallows new job notifications" do
        expect(Setting.new_jobs).to_not include settings(:john)
      end
    end

    describe "new resumes" do
      it "returns settings of who allows new resumes notifications" do
        expect(Setting.new_resumes).to include settings(:david)
        expect(Setting.new_resumes).to include settings(:maria)
      end

      it "does not return settings of who disallows new job notifications" do
        expect(Setting.new_resumes).to_not include settings(:john)
      end
    end
  end
end