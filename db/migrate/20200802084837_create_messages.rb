class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.integer :receiver
      t.integer :sender

      t.timestamps
    end
  end
end
