class CreateFigureTitles < ActiveRecord::Migration[5.1]
  def change
    create_table :figure_titles do |t|
      t.integer :figure_id
      t.integer :title_id
    end
  end
end
