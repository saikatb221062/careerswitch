class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :provider
      t.string :title
      t.integer :cost
      t.integer :duration
      t.text :provider_url
      t.integer :hourse_per_week

      t.timestamps
    end
  end
end
