require "minitest/autorun"
require_relative "../../tile_rack.rb"

class TileRack::TestRemoveWord < Minitest::Test
  def setup
    @rack = TileRack.new
  end

  def test_can_remove_a_word_whose_letters_are_in_order_on_the_rack
    @rack.append(:C)
    @rack.append(:O)
    @rack.append(:N)
    @rack.append(:F)
    @rack.append(:I)
    @rack.append(:G)
    @rack.append(:S)

    word = @rack.remove_word("CON")    
    assert_equal(3, word.tiles.length) 
    assert_equal(:C, word.tiles[0])
    assert_equal(:O, word.tiles[1])
    assert_equal(:N, word.tiles[2])

    assert_equal(4, @rack.tiles.length)
    assert_equal(:F, @rack.tiles[0])
    assert_equal(:I, @rack.tiles[1])
    assert_equal(:G, @rack.tiles[2])
    assert_equal(:S, @rack.tiles[3])
  end  

  def test_can_remove_a_word_whose_letters_are_not_in_order_on_the_rack
    @rack.append(:C)
    @rack.append(:O)
    @rack.append(:N)
    @rack.append(:F)
    @rack.append(:I)
    @rack.append(:G)
    @rack.append(:S)

    word = @rack.remove_word("FOG")    
    assert_equal(3, word.tiles.length) 
    assert_equal(:F, word.tiles[0])
    assert_equal(:O, word.tiles[1])
    assert_equal(:G, word.tiles[2])

    assert_equal(4, @rack.tiles.length)
    assert_equal(:C, @rack.tiles[0])
    assert_equal(:N, @rack.tiles[1])
    assert_equal(:I, @rack.tiles[2])
    assert_equal(:S, @rack.tiles[3])
  end

  def test_can_remove_word_with_duplicate_letters
    @rack.append(:B)
    @rack.append(:A)
    @rack.append(:N)
    @rack.append(:A)
    @rack.append(:N)
    @rack.append(:A)
    @rack.append(:S)

    word = @rack.remove_word("BANANA")    
    assert_equal(6, word.tiles.length) 
    assert_equal(:B, word.tiles[0])
    assert_equal(:A, word.tiles[1])
    assert_equal(:N, word.tiles[2])
    assert_equal(:A, word.tiles[3])
    assert_equal(:N, word.tiles[4])
    assert_equal(:A, word.tiles[5])

    assert_equal(1, @rack.tiles.length)
    assert_equal(:S, @rack.tiles[0])
  end

  def test_can_remove_word_without_removing_unneeded_duplicate_letters
    @rack.append(:B)
    @rack.append(:A)
    @rack.append(:N)
    @rack.append(:A)
    @rack.append(:N)
    @rack.append(:A)
    @rack.append(:S)

    word = @rack.remove_word("NANA")    
    assert_equal(4, word.tiles.length) 
    assert_equal(:N, word.tiles[0])
    assert_equal(:A, word.tiles[1])
    assert_equal(:N, word.tiles[2])
    assert_equal(:A, word.tiles[3])

    assert_equal(3, @rack.tiles.length)
    assert_equal(:B, @rack.tiles[0])
    assert_equal(:A, @rack.tiles[1])
    assert_equal(:S, @rack.tiles[2])
  end
end