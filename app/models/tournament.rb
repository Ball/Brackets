class Tournament
  include Mongoid::Document
  field :name
  field :start_time, :type => Date
  embeds_many :seedings, :class_name => "Seeding"
  embeds_one :opening_round, :class_name => "Game"

  accepts_nested_attributes_for :seedings

  def populate_seeds
    (1...4).collect do |seed|
      self.seedings << Seeding.new
    end
  end
end
