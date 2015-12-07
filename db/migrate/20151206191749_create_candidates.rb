class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.belongs_to :job, index: true, foreign_key: true, null: false
      t.string :firstname, required: true
      t.string :lastname, required: true
      t.string :headline, required: true
      t.text :coverletter
      t.string :resume, required: true
      t.timestamps null: false
    end
  end
end
