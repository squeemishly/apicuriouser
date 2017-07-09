class CreateOrgs < ActiveRecord::Migration[5.1]
  def change
    create_table :orgs do |t|
      t.string :name
      t.integer :org_id
      t.references :user, foreign_key: true
    end
  end
end
