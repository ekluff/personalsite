class RemoveLensFromExifs < ActiveRecord::Migration
  def change
    remove_column :exifs, :lens, :string
  end
end
