class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :completion, default: false
      t.integer :tomatoes, default: 0


      t.belongs_to :user
      t.timestamps
    end
  end
end
