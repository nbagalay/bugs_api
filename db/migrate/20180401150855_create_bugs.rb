class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description
      t.string :issue_type, default: 2
      t.string :priority, default: 1
      t.string :status, default: 0

      t.timestamps
    end
  end
end
