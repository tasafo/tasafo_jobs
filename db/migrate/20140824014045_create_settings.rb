class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.belongs_to :user, index: true
      t.boolean :new_jobs, default: true
      t.boolean :new_resumes, default: true

      t.timestamps
    end
  end
end
