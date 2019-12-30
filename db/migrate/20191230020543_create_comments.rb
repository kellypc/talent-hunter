class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :profile
      t.belongs_to :headhunter

      t.timestamps
    end
  end
end
