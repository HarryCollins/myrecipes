class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :header
      t.text :body
      t.integer :rating   
      t.integer :chef_id
      t.integer :recipe_id      
      t.timestamps
    end
  end
end
