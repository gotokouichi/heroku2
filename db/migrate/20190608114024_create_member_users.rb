class CreateMemberUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :member_users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :image
      t.string :gender
      t.string :prefecture
      t.string :part
      t.string :genre
      t.string :artist
      t.text :url
      t.text :desscription
      t.timestamps
    end
  end
end
