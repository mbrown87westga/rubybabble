require "minitest/autorun"
require_relative "../../tile_group.rb"

class TileGroup::TestInitialize < Minitest::Test
  def setup
    @tile_group = TileGroup.new
  end

  def test_create_empty_tile_group
    assert_equal(0, @tile_group.tiles.length)
  end
end
