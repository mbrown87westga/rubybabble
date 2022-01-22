class Word < TileGroup
  def initialize
  end

  def score
    @tiles.sum { |tile| TileBag::points_for(tile)}
  end
end