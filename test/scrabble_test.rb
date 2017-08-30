gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    #skip
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word
    assert_equal 2, Scrabble.new.score("an")
    assert_equal 6, Scrabble.new.score('dim')
  end

  def test_it_scores_empty_string_as_zero_points
    assert_equal 0, Scrabble.new.score('')
  end

  def test_it_scores_nil_input_as_zero_points
    assert_equal 0, Scrabble.new.score('')
  end

  def test_calculate_points_returns_array_of_point_values
    assert_equal [1,2,3], Scrabble.new.calculate_points('adb')
  end

  def test_it_finds_score_given_tile_positions_on_board
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end
end
