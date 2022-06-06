class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :title
      t.string :skill_level

      t.timestamps
    end
  end
end
