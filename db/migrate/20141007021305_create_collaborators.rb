class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.references :wiki
      t.references :user

      t.timestamps
    end
  end
end
