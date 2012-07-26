class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :result
      t.integer :home_id, :null => false
      t.integer :away_id, :null => false
      t.references :round
      
      t.timestamps
    end
  end
end
