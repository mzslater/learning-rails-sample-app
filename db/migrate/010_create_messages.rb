class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :company
      t.string :phone
      t.string :subject
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
