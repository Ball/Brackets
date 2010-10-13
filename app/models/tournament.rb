class Tournament
  include Mongoid::Document
  field :name
  field :start_time, :type => Date
  embeds_many :seedings, :class_name => "Seeding"
  embeds_one :opening_round, :class_name => "Game"

  accepts_nested_attributes_for :seedings

  def populate_seeds
    ["Midwest", "East", "West", "South"].each do |region|
      (1..17).collect do |seed|
        seeding = Seeding.new
	seeding.region = region
	seeding.seed = seed
        self.seedings << seeding
      end
    end
  end
end
