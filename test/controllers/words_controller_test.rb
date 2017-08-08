require 'test_helper'

class WordsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def test_call_for_index
   get words_path
   assert_response :success
 end
end
