class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :user, index: true
      t.belongs_to :category
      t.string :title
      t.string :company_name
      t.string :site_url
      t.string :location
      t.text :description
      t.text :contact_message

      t.timestamps
    end
  end
end
