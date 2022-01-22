require "minitest/autorun"
require_relative "../../tile_bag.rb"

class TileBag::TestDrawTile < Minitest::Test
  def setup
    @tile_bag = TileBag.new
  end

  def test_has_proper_number_of_tiles
    98.times do
      refute @tile_bag.empty?
      @tile_bag.draw_tile
    end

    assert @tile_bag.empty?
  end

  def test_has_proper_tile_distribution
    bag = [
      :E, :E, :E, :E, :E, :E, :E, :E, :E, :E, :E, :E, :A, :A, :A, :A, :A, :A, :A, :A,
      :A, :I, :I, :I, :I, :I, :I, :I, :I, :I, :O, :O, :O, :O, :O, :O, :O, :O, :N, :N,
      :N, :N, :N, :N, :R, :R, :R, :R, :R, :R, :T, :T, :T, :T, :T, :T, :L, :L, :L, :L,
      :S, :S, :S, :S, :U, :U, :U, :U, :D, :D, :D, :D, :G, :G, :G, :B, :B, :C, :C, :M,
      :M, :P, :P, :F, :F, :H, :H, :V, :V, :W, :W, :Y, :Y, :K, :J, :X, :Q, :Z
    ]

    98.times do
      tile = @tile_bag.draw_tile
      index = bag.index(tile)
      assert index != nil
      bag.delete_at(index)
    end
    
    assert bag.empty?
  end
end
