class Pool
  include Mongoid::Document
  field :name, :type => String
  field :owner, :type => String
  field :tournament_id
  embeds_many :brackets

  def owner_name
     if(owner.nil?)
	     "coward"
     else
	     User.find(owner).email
     end
  end
end
