class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :description
      t.string :start_date
      t.string :deliver_date
      t.integer :miles
      t.integer :earnings

      t.timestamps
    end
  end
end
