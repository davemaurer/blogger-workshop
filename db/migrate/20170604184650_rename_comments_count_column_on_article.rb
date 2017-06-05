class RenameCommentsCountColumnOnArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :comment_count
    add_column :articles, :comments_count, :integer, default: 0, null: false
  end
end
