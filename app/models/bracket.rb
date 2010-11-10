class Bracket
  include Mongoid::Document
  field :name, :type => String
  field :owner, :type => String


  embeds_many :picks, :class_name => "Pick"

  embedded_in :pool, :inverse_of => :brackets

  def self.build()
    temp = Bracket.new()
    temp.populate_picks
    temp
  end

  def populate_picks
    build_picks(4, 0)
    build_picks(32, 1)
    build_picks(16, 2)
    build_picks(8, 3)
    build_picks(4, 4)
    build_picks(2, 5)
    build_picks(1, 6)
    self
  end
  private
  def build_picks(number, round)
	  (1..number).each do |n|
	    self.picks << Pick.new().tap{|i| i.round = round; i.game_number = n}
	  end
  end
end
