class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :header
      t.text :body
      t.references :document

      t.timestamps
    end
    add_index :pages, :document_id
  end
end
