module BracketHelper
  def one_side(p)
    "one_" +(p.game_number <= 16 ? "left" : "right")
  end
  def zero_side(p)
    "zero_" + (p.game_number <= 2 ? "left" : "right")
  end
end
