require "minitest/autorun"
require_relative "../../word.rb"

class Word::TestScore < Minitest::Test
  def setup
    @word = Word.new
  end

  def test_empty_word_should_have_score_of_zero
    assert_equal(0, @word.score)
  end

  def test_score_a_one_tile_word
    @word.append(:B)
    assert_equal(3, @word.score)
  end

  def test_score_a_word_with_multiple_different_tiles
    @word.append(:B)
    @word.append(:A)    
    @word.append(:N)
    assert_equal(5, @word.score)
  end

  def test_score_a_word_with_recurring_tiles
    @word.append(:B)
    @word.append(:A)    
    @word.append(:N)
    @word.append(:A)    
    @word.append(:N)
    @word.append(:A)
    assert_equal(8, @word.score)
  end
end
