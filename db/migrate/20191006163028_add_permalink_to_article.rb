class AddPermalinkToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :permalink, :string
    add_index :articles, :permalink
  end
end
