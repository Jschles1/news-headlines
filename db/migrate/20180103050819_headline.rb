class Headline < ActiveRecord::Migration[5.1]
  def change
    create_table :headlines do |t|
      t.string :website
      t.string :title
      t.string :url
    end
  end
end
