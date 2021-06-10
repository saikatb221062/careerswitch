class CreateRoadmapTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :roadmap_topics do |t|

      t.timestamps
    end
  end
end
