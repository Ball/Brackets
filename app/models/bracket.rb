class Bracket
  include Mongoid::Document
  field :name, :type => String
  field :owner, :type => String


  embeds_many :picks, :class_name => "Pick"

  embedded_in :pool, :inverse_of => :brackets

  def self.build(pool)
    temp = Bracket.new()
    temp.pool = pool
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

  def populate_teams(tournament)
    teams_by_region = tournament.regions_and_teams_sorted

    populate_round_zero(teams_by_region)
    populate_round_one(teams_by_region)

  end

  def round_zero
    picks_for_round(0)
  end

  def round_one
    picks_for_round(1)
  end

  private
  def build_picks(number, round)
	  (1..number).each do |n|
	    self.picks << Pick.new().tap{|i| i.round = round; i.game_number = n}
	  end
  end

  def populate_round_zero(teams_by_region)
    teams_by_region.each_with_index do |seedings, j|
      teams = seedings.select {|s| s.seed > 15}.collect{|s| s.team}

      round_zero[j].team1 = teams[0]
      round_zero[j].team2 = teams[1]
    end
  end
  def populate_round_one(teams_by_region)
    teams_by_region.each_with_index do |seedings, j|
      starting_position_lookup = [0, 7, 5, 3, 2, 4, 6, 1]
      region_offset = j*8
      (0...(seedings.size / 2)).each do | i |
        round_one[region_offset + starting_position_lookup[i]].team1 = seedings[i].team
        round_one[region_offset + starting_position_lookup[i]].team2 = seedings[15-i].team unless i == 0
      end
    end

    # Clean up and ensure team 1 plays noone (winner of round zero)
    teams_by_region.each_with_index do |seedings, j|
      team = seedings.select{|s| s.seed == 1}.first.team
      round_one[j*8].team1 = team
      round_one[j*8].team2 = nil
    end
  end
  def picks_for_round(round_number)
    picks.select{|p| p.round == round_number}
  end
end
