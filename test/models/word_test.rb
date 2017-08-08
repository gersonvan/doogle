require 'test_helper'

class WordTest < ActiveSupport::TestCase

  def test_dicapi_search
    search_name = "unconstitutional"
    word = Word.dicapi_search(search_name)
    word.slice(:words, :suggestions)
    assert_equal(words(:dicapi).definition, word[:words][0]['definition'])
  end
end
