class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :category, index: true, null: false

      t.string :name, null: false
      t.string :title, null: false
      t.string :facebook_url
      t.string :twitter_url
      t.string :google_plus_url
      t.string :linked_in_url
      t.string :phone
      t.string :site_url
      t.string :contact_email
      t.string :location

      t.boolean :available, default: false
      t.boolean :listed, default: false

      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
