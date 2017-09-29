class CreateHollywoods < ActiveRecord::Migration[5.1]
  def change
    create_table :hollywoods do |t|
      t.string :question
      t.string :o1
      t.string :o2
      t.string :o3
      t.string :o4
      t.string :correctans
      t.boolean :MultiChoice

      t.timestamps
    end
  end
end
