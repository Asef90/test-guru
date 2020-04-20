class AddTimestampsToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :test_passages
  end
end
