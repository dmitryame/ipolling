require File.dirname(__FILE__) + '/../test_helper'
require 'poll_controller'

# Re-raise errors caught by the controller.
class PollController; def rescue_action(e) raise e end; end

class PollControllerTest < Test::Unit::TestCase
  def setup
    @controller = PollController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
