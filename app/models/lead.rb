class Lead < ActiveRecord::Base

  belongs_to :player

  validates_presence_of :player
  
  after_save :update_points

  def update_points
    player = self.player

    # Creating a lead is worth 1
    player.points = (player.points || 0) + 1
    player.save!

    # Add a lead phone: 1
    player.points = player.points + (self.phone.nil? ? 0 : 1)
    player.save!

    # Add a lead email: 1
    player.points = player.points + (self.email.nil? ? 0 : 1)
    player.save!

    # Add a lead note: 1
    player.points = player.points + (self.notes.nil? ? 0 : 1)
    player.save!
  end

  def lead_player
    self.player.attributes
  end

  def as_json(options={})
    super(options.merge(:methods => [:lead_player]))
  end

end
