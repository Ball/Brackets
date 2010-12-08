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

  def populate_teams(tournament)
    teams_by_region = tournament.seedings.inject({}) do |hash, seeding|
      hash[seeding.region] ||= []
      hash[seeding.region] << seeding
      hash
    end
    teams_by_region.each_pair do |region, seedings|
      seedings.sort!{|a, b| a.seed <=> b.seed}
    end

    teams_by_region.values.each_with_index do |seedings, j|
      teams = seedings.select {|s| s.seed > 15}.collect{|s| s.team}.sort

      round_zero[j].team1 = teams[0]
      round_zero[j].team2 = teams[1]
    end

    teams_by_region.values.each_with_index do |seedings, j|
      magic = j * 8 
      (0...(seedings.size / 2)).each do | i |
	puts "Team 1 #{seedings[i].team} vs Team 2 #{seedings[15-i].team} at game #{i + magic}"
	round_one[i + magic].team1 = seedings[i].team
        round_one[i + magic].team2 = seedings[15-i].team unless i == 0
      end
    end

    #teams_by_region.values_at(teams_by_region.keys.sort).each_with_index do |seedings, j|
    teams_by_region.values_at("Midwest", "East", "West", "South").each_with_index do |seedings, j|
      team = seedings.select{|s| s.seed == 1}.first.team
      
      round_one[j*8].team1 = team
    end
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

  def picks_for_round(round_number)
    picks.select{|p| p.round == round_number}
  end
end
