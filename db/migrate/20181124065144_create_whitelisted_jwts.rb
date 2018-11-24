class CreateWhitelistedJwts < ActiveRecord::Migration[5.2]
  def change
    create_table :whitelisted_jwts do |t|
      t.string :jti, null: false
      t.string :aud, null: false
      t.datetime :exp, null: false
      t.references :user, foreign_key: { on_delete: :cascade }, null: false
    end
    add_index :whitelisted_jwts, :jti, unique: true
  end
end
