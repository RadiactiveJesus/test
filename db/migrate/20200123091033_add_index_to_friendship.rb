class AddIndexToFriendship < ActiveRecord::Migration[5.2]
  def change
    def change
      add_index :friendships, %i[user_id friend_id]
    end
  end
end
