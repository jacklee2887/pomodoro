class CreateTomatoes < ActiveRecord::Migration[5.2]
  def change
    create_table :tomatoes do |t|
      t.boolean :completion, default: false

      t.belongs_to :user
      t.belongs_to :task
      t.timestamps
    end
  end
end
