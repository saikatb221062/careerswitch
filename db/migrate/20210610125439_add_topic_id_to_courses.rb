class AddTopicIdToCourses < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :topic, index: true, foreign_key: true
  end
end
