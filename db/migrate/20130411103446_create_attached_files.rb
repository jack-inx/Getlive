class CreateAttachedFiles < ActiveRecord::Migration
  def change
    create_table :attached_files do |t|
      
      t.integer :attachment_id
      t.string  :attachment_type
      t.attachment :dumpfile
      t.timestamps
    end
  end
end
