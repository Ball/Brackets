class Bracket
  include Mongoid::Document
  field :name, :type => String
  field :owner, :type => String

  #TODO, the rest

  embedded_in :pool, :inverse_of => :brackets
end
