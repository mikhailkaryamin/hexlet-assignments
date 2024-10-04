class CreatePostComments < ActiveRecord::Migration[7.2]
  def change
    create_table :post_comments do |t|
      t.text :body
      t.belongs_to :post

      t.timestamps
    end
  end
end
