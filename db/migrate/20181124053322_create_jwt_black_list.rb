class CreateJwtBlackList < ActiveRecord::Migration[5.2]
  def change
    create_table :jwt_black_list do |t|
      t.string :jti, null: false

      t.timestamps
    end
    add_index :jwt_black_list, :jti
  end
end
