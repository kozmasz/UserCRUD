# encoding: utf-8

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name,       null: false, unique: true
      t.date   :birth_date, null: false
    end
  end
end
