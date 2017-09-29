class CreateCrickets < ActiveRecord::Migration[5.1]
  def change
    create_table :crickets do |t|
      t.string :question
      t.string :o1
      t.string :o2
      t.string :o3
      t.string :o4
      t.string :correctans

      t.timestamps
    end
  end
end
