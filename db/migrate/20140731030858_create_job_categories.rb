class CreateJobCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :job_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
