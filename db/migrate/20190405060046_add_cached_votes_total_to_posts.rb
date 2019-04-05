class AddCachedVotesTotalToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :cached_votes_up, :integer, default: 0
  end
end
