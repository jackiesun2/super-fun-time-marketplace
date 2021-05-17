class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :description
      t.references :reviewer, null: false, foreign_key: {to_table: :users}
      t.references :reviewee, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
