require 'test_helper'

class LogEntryTest < ActiveSupport::TestCase
  def setup
    @user = users(:david)
    @log_entry = @user.log_entries.new( {content: "Lorem Ipsum", user_id: @user.id})
  end
  
  test "should be valid" do 
    @log_entry.valid?
  end
  
  test "user id should be present" do
    @log_entry.user_id = nil
    assert_not @log_entry.valid?
  end
  
  test "content should be present" do 
    @log_entry.content = nil
    assert_not @log_entry.valid?
  end
  
  # test "last should be first" do
  #   assert_equal log_entries(:most_recent), LogEntry.first
  # end
end
