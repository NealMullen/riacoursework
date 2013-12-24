class CreatePosttypes < ActiveRecord::Migration
  def change
    create_table :posttypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
