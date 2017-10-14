class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :category, null: false

      t.string :title, null: false
      t.string :company_name, null: false
      t.string :site_url
      t.string :location

      t.text :description, null: false
      t.text :contact_message, null: false

      t.timestamps null: false
    end
  end
end
