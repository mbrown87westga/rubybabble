require "minitest/autorun"
require_relative "../../tile_rack.rb"

class TileRack::TestHasTilesFor < Minitest::Test
  def setup
    @rack = TileRack.new
  end

  def test_rack_has_needed_letters_when_letters_are_in_order_no_duplicates
    @rack.append(:C)
    @rack.append(:O)
    @rack.append(:N)
    @rack.append(:F)
    @rack.append(:I)
    @rack.append(:G)
    @rack.append(:S)

    assert(@rack.has_tiles_for?("CON"))
  end

  def test_rack_has_needed_letters_when_letters_are_not_in_order_no_duplicates
    @rack.append(:C)
    @rack.append(:O)
    @rack.append(:N)
    @rack.append(:F)
    @rack.append(:I)
    @rack.append(:G)
    @rack.append(:S)

    assert(@rack.has_tiles_for?("FOG"))
  end

  def test_rack_doesnt_contain_any_needed_letters
    @rack.append(:C)
    @rack.append(:O)
    @rack.append(:N)
    @rack.append(:F)
    @rack.append(:I)
    @rack.append(:G)
    @rack.append(:S)

    refute(@rack.has_tiles_for?("BAT"))
  end

  def test_rack_contains_some_but_not_all_needed_letters
    @rack.append(:C)
    @rack.append(:O)
    @rack.append(:N)
    @rack.append(:F)
    @rack.append(:I)
    @rack.append(:G)
    @rack.append(:S)

    refute(@rack.has_tiles_for?("MONTY"))
  end

  def test_rack_contains_a_word_with_duplicate_letters
    @rack.append(:B)
    @rack.append(:A)
    @rack.append(:N)
    @rack.append(:A)
    @rack.append(:N)
    @rack.append(:A)
    @rack.append(:S)

    assert(@rack.has_tiles_for?("NANA"))
  end

  def test_rack_doesnt_contain_enough_duplicate_letters
    @rack.append(:B)
    @rack.append(:A)
    @rack.append(:N)
    @rack.append(:A)
    @rack.append(:N)
    @rack.append(:O)
    @rack.append(:S)

    refute(@rack.has_tiles_for?("BANANA"))
  end
end