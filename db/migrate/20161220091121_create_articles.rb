class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
        t.string :title     #creating the column title with string integer
    end
  end
end
