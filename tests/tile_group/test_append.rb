require "minitest/autorun"
require_relative "../../tile_group.rb"

class TileGroup::TestAppend < Minitest::Test
  def setup
    @tile_group = TileGroup.new
  end

  def test_append_one_tile
    @tile_group.append(:A)

    assert_equal(1, @tile_group.tiles.length)
    assert_equal(:A, @tile_group.tiles[0])
  end

  def test_append_many_tiles
    @tile_group.append(:A)
    @tile_group.append(:B)
    @tile_group.append(:C)
    @tile_group.append(:D)
    @tile_group.append(:E)

    assert_equal(5, @tile_group.tiles.length)
    assert_equal(:A, @tile_group.tiles[0])
    assert_equal(:B, @tile_group.tiles[1])
    assert_equal(:C, @tile_group.tiles[2])
    assert_equal(:D, @tile_group.tiles[3])
    assert_equal(:E, @tile_group.tiles[4])
  end

  def test_append_duplicate_tiles
    @tile_group.append(:A)
    @tile_group.append(:A)
    @tile_group.append(:A)

    assert_equal(3, @tile_group.tiles.length)
    assert_equal(:A, @tile_group.tiles[0])
    assert_equal(:A, @tile_group.tiles[1])
    assert_equal(:A, @tile_group.tiles[2])
  end
end
