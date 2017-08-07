require 'test_helper'

class WordTest < ActiveSupport::TestCase
  fixtures :words

    def test_word
      word = Word.index('testey'
         :definition => words(:one).definition,

          msg = "Palavra não foi salva. "
      + "errors: ${word.errors.inspect}"
      assert word.save, msg

      word_one_copia = Word.find(word.id)

      assert_equal word.nome, word_one_copia.nome
    end
end
