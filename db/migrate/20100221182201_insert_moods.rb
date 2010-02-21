class InsertMoods < ActiveRecord::Migration
  def self.up
    Mood.create!(:name => "Happy")
    Mood.create!(:name => "Angry")
    Mood.create!(:name => "Sad")
    Mood.create!(:name => "meh...")
  end

  def self.down
    sql = "delete from moods"
    execute sql
  end
end
