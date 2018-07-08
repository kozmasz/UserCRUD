class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.belongs_to :user
      t.string     :email, null: false
    end
  end
end
