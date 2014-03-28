class Entries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :input
      t.text :keywords
    end
  end
end
