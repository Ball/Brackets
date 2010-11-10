class Pick
  include Mongoid::Document
  field :team1, :type => String
  field :team2, :type => String
  field :winner, :type => String
  field :round, :type => Integer
  field :game_number, :type => Integer
  embedded_in :bracket, :inverse_of => :picks
end
