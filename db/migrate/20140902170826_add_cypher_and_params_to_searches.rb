class AddCypherAndParamsToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :cypher, :text
    add_column :searches, :params, :string
  end
end
