require "minitest/autorun"
require_relative "../../tile_bag.rb"

class TileBag::TestPointsFor  < Minitest::Test
  def setup
    @tile_bag = TileBag.new
  end

  def test_confirm_point_values
    assert_equal 1, TileBag::points_for(:E)
  end
end
