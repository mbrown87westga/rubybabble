class TileGroup
  attr_accessor :tiles

  def initialize
    @tiles = []
  end

  def append(tile)
    @tiles.append(tile)
  end

  def remove(tile)
    @tiles.delete_at(@tiles.index(tile))
  end

  def hand
    @tiles.join
  end
end