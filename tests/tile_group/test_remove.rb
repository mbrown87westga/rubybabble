require "minitest/autorun"
require_relative "../../tile_group.rb"

class TileGroup::TestRemove < Minitest::Test
  def setup
    @tile_group = TileGroup.new
  end

  def test_remove_only_tile
    @tile_group.append(:A)

    @tile_group.remove(:A)

    assert_equal(0, @tile_group.tiles.length)
  end

  def test_remove_first_tile_from_many
    @tile_group.append(:A)
    @tile_group.append(:B)
    @tile_group.append(:C)
    @tile_group.append(:D)
    @tile_group.append(:E)

    @tile_group.remove(:A)

    assert_equal(4, @tile_group.tiles.length)
    assert_equal(:B, @tile_group.tiles[0])
    assert_equal(:C, @tile_group.tiles[1])
    assert_equal(:D, @tile_group.tiles[2])
    assert_equal(:E, @tile_group.tiles[3])
  end

  def test_remove_last_tile_from_many
    @tile_group.append(:A)
    @tile_group.append(:B)
    @tile_group.append(:C)
    @tile_group.append(:D)
    @tile_group.append(:E)

    @tile_group.remove(:E)

    assert_equal(4, @tile_group.tiles.length)
    assert_equal(:A, @tile_group.tiles[0])
    assert_equal(:B, @tile_group.tiles[1])
    assert_equal(:C, @tile_group.tiles[2])
    assert_equal(:D, @tile_group.tiles[3])
  end

  def test_remove_middle_tile_from_many
    @tile_group.append(:A)
    @tile_group.append(:B)
    @tile_group.append(:C)
    @tile_group.append(:D)
    @tile_group.append(:E)

    @tile_group.remove(:C)

    assert_equal(4, @tile_group.tiles.length)
    assert_equal(:A, @tile_group.tiles[0])
    assert_equal(:B, @tile_group.tiles[1])
    assert_equal(:D, @tile_group.tiles[2])
    assert_equal(:E, @tile_group.tiles[3])
  end

  def test_remove_multiple_tiles
    @tile_group.append(:A)
    @tile_group.append(:B)
    @tile_group.append(:C)
    @tile_group.append(:D)
    @tile_group.append(:E)

    @tile_group.remove(:A)
    @tile_group.remove(:C)
    @tile_group.remove(:E)

    assert_equal(2, @tile_group.tiles.length)
    assert_equal(:B, @tile_group.tiles[0])
    assert_equal(:D, @tile_group.tiles[1])
  end

  def test_make_sure_duplicates_are_not_removed
    @tile_group.append(:A)
    @tile_group.append(:B)
    @tile_group.append(:B)
    @tile_group.append(:B)
    @tile_group.append(:E)

    @tile_group.remove(:B)

    assert_equal(4, @tile_group.tiles.length)
    assert_equal(:A, @tile_group.tiles[0])
    assert_equal(:B, @tile_group.tiles[1])
    assert_equal(:B, @tile_group.tiles[2])
    assert_equal(:E, @tile_group.tiles[3])
  end
end
