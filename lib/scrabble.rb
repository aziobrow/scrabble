require 'pry'

class Scrabble


  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def calculate_points(word)
    uppercase = word.upcase
    keys = uppercase.split('')
    keys.map {|key| point_values[key]}
  end

  def score(word)
    points = calculate_points(word)
    points.sum
  end

  def score_with_multipliers(word, multipliers)
    multiplied_score = []

    multipliers.each_with_index do |multiplier, index|
      points = calculate_points(word)
      current_letter_points = points[index]

      total_points_for_letter = current_letter_points * multiplier
      multiplied_score << total_points_for_letter
    end
    multiplied_score.sum
  end
end
