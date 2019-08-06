class AddDaysToExpireToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :days_to_expire, :integer
  end
end
