require 'spellchecker'
require 'tempfile'
require_relative "tile_bag.rb"
require_relative "tile_rack.rb"

class Babble
  def initialize
    @bag = TileBag.new
    @rack = TileRack.new
  end

  def run
    puts "Welcome to Babble!"
    puts "Please use the letters below to spell a word. Type :quit to exit."

    should_exit = false
    total_score = 0
    until should_exit
      replenish_rack

      puts "Your rack contains: #{@rack.hand}"
      puts "Guess a word"
      guess = gets.chomp.upcase
      if guess == ":QUIT"
        should_exit = true
      else
        unless Spellchecker::check(guess)[0][:correct]
          puts "Not a valid word"
        else
            unless @rack.has_tiles_for?(guess)
              puts "Not enough tiles"
            else
              word = @rack.remove_word(guess)
              score = word.score
              total_score += score
              puts "You made #{guess} for #{score} points"
            end
        end

        puts "Your total score is currently #{total_score}"
      end 
    end

    puts "Thanks for playing, total score: #{total_score}"
  end

  def replenish_rack
    @rack.number_of_tiles_needed.times { @rack.append(@bag.draw_tile) }
  end
end

Babble.new.run