class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title, required: true
      t.text :description, required: true
      t.timestamps null: false
    end
  end
end
