require "minitest/autorun"
require_relative "../../tile_rack.rb"

class TileRack::TestNumberOfTilesNeeded < Minitest::Test
  def setup
    @rack = TileRack.new
  end

  def test_empty_tile_rack_should_need_max_tiles
    assert_equal(7, @rack.number_of_tiles_needed)
  end

  def test_tile_rack_with_one_tile_should_need_max_minus_one_tiles
    @rack.append(:B)

    assert_equal(6, @rack.number_of_tiles_needed)
  end

  def test_tile_rack_with_several_tiles_should_need_some_tiles
    @rack.append(:B)
    @rack.append(:A)
    @rack.append(:G)

    assert_equal(4, @rack.number_of_tiles_needed)
  end

  def test_that_full_tile_rack_doesnt_need_any_tiles
    @rack.append(:B)
    @rack.append(:A)
    @rack.append(:G)
    @rack.append(:G)
    @rack.append(:I)
    @rack.append(:N)
    @rack.append(:S)

    assert_equal(0, @rack.number_of_tiles_needed)
  end
end