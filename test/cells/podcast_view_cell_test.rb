require 'test_helper'

class PodcastViewCellTest < Cell::TestCase
  test "index" do
    invoke :index
    assert_select "p"
  end
  
  test "show" do
    invoke :show
    assert_select "p"
  end
  

end
