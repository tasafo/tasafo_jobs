class AddExpireAtToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :expire_at, :datetime
  end
end
