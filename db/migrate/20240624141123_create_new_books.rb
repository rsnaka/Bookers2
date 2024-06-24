class CreateNewBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :new_books do |t|
      t.string :title
      t.string :opinion
      t.timestamps
    end
  end
end
