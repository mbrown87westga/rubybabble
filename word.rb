require_relative "tile_group.rb"

class Word < TileGroup
  def score
    tiles.sum { |tile| TileBag::points_for(tile)}
  end
end