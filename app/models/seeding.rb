class Seeding
  include Mongoid::Document
  field :team
  field :region
  field :seed, :type => Integer
end
