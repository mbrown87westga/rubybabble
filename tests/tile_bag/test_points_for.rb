require "minitest/autorun"
require_relative "../../tile_bag.rb"

class TileBag::TestPointsFor < Minitest::Test
  def do_point_test letter, score
    assert_equal score, TileBag::points_for(letter)
  end

  def test_confirm_point_values
    [:E, :A, :I, :O, :N, :R, :T, :L, :S, :U].each { |l| do_point_test l, 1 }
    [:D, :G].each { |l| do_point_test l, 2 }
    [:B, :C, :M, :P].each { |l| do_point_test l, 3 }
    [:F, :H, :V, :W, :Y].each { |l| do_point_test l, 4 }
    assert_equal 5, TileBag::points_for(:K)
    [:J, :X].each { |l| do_point_test l, 8 }
    [:Q, :Z].each { |l| do_point_test l, 10 }
  end
end
