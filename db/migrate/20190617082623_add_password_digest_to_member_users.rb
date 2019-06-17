class AddPasswordDigestToMemberUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :member_users, :password_digest, :string
  end
end
