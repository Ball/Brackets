class Tournament
  include Mongoid::Document
  field :name
  field :start_time, :type => Date
  embeds_many :seeding, :class_name => "Seeding"
  embeds_one :opening_round, :class_name => "Game"

  accepts_nested_attributes_for :seeding
end
