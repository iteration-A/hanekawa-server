class CreateChatRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_rooms do |t|
      t.string :topic

      t.timestamps
    end
    add_index :chat_rooms, :topic, unique: true
  end
end
