require "minitest/autorun"
require_relative "../../word.rb"

class Word::TestInitialize < Minitest::Test
  def setup
    @word = Word.new
  end

  def test_create_empty_word
    assert_equal(0, @word.score)
  end
end
