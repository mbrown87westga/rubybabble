require "minitest/autorun"
require_relative "../../tile_group.rb"

class TileGroup::TestHand < Minitest::Test
  def setup
    @tile_group = TileGroup.new
  end

  def test_convert_empty_group_to_string
    assert_equal("", @tile_group.hand)
  end

  def test_convert_single_tile_group_to_string
    @tile_group.append(:A)

    assert_equal("A", @tile_group.hand)
  end

  def test_convert_multi_tile_group_to_string
    @tile_group.append(:A)
    @tile_group.append(:B)
    assert_equal("AB", @tile_group.hand)
  end

  def test_convert_multi_tile_group_with_duplicates_to_string
    @tile_group.append(:A)
    @tile_group.append(:A)
    @tile_group.append(:A)
    assert_equal("AAA", @tile_group.hand)
  end
end
