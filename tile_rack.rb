require_relative "tile_group.rb"
require_relative "word.rb"

class TileRack < TileGroup
  def number_of_tiles_needed
    7 - tiles.length
  end

  def has_tiles_for?(text)
    copy = tiles.dup
    text.split('').each do  |substring|
      tile = substring.to_sym
      index = copy.index(tile)
      if index.nil?
        return false
      else
        copy.delete_at(index)
      end
    end
    true
  end

  def remove_word(text)
    return_word = Word.new    
    text.split('').each do |substring|
      tile = substring.to_sym
      index = tiles.index(tile)
      unless index.nil?
        tiles.delete_at(index)
        return_word.append(tile)
      end
    end
    return_word
  end
end