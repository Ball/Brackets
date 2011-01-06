class Tournament
  include Mongoid::Document
  field :name
  field :start_time, :type => Date
  embeds_many :seedings, :class_name => "Seeding"
  embeds_one :opening_round, :class_name => "Game"

  accepts_nested_attributes_for :seedings
  def regions
    ["Midwest", "West", "East", "South"]
  end
  def populate_seeds
    regions.each do |region|
      (1..17).collect do |seed|
        seeding = Seeding.new
	seeding.region = region
	seeding.seed = seed
        self.seedings << seeding
      end
    end
  end
  def regions_and_teams_sorted
    teams_by_region = seedings.inject([]) do |array, seeding|
      index = regions.index(seeding.region)
      array[index] ||= []
      array[index] << seeding
      array
    end
    teams_by_region.each do |seedings|
      seedings.sort!{|a, b| a.seed <=> b.seed}
    end
    teams_by_region
  end
end
