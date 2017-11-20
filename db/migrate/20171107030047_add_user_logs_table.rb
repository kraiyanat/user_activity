class AddUserLogsTable < ActiveRecord::Migration[5.1]
  def change
  	create_table :user_activity_logs do |t|
      t.integer :user_id
      t.string :user_name
      t.string :object_id
      t.string :controller
      t.string :action
      t.string :activity
      t.string :http_request
 
      t.timestamps
    end
  end
end
