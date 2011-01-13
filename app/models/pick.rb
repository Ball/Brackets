class Pick
  include Mongoid::Document
  field :team1, :type => String
  field :team2, :type => String
  field :winner, :type => String
  field :round, :type => Integer
  field :game_number, :type => Integer
  embedded_in :bracket, :inverse_of => :picks

  def seeding1
    seed = bracket.pool.tournament.seeding_for_team(team1)
    seed.nil? ? "" : seed.seed
  end

  def seeding2
    seed = bracket.pool.tournament.seeding_for_team(team2)
    seed.nil? ? "" : seed.seed
  end
end
