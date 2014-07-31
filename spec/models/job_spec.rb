require 'spec_helper'

describe Job do
  fixtures :users
  fixtures :jobs

  describe "scopes" do
    describe "owned_by user" do
      it "returns jobs owned by user" do
        expect(Job.owned_by(users(:david))).to include jobs(:ruby)
      end

      it "does not return jobs that are not owned by user" do
        expect(Job.owned_by(users(:david))).to_not include jobs(:designer)
      end       
    end
  end
end
