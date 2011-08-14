class Lead < ActiveRecord::Base

  belongs_to :player

  validates_presence_of :player
  
  after_save :update_points

  def update_points
    player = self.player

    # TODO: Create a class method to do this within the rules class
    #Rule.score_by_object_type("lead")

    Rule.find_all_by_object_type("lead").each do |rule|
      points = (player.points || 0)
      case rule.rule_type
        when "creation"
          player.points = points + rule.points
        when "presence"
          player.points = points + (self.send(rule.trigger).nil? ? 0 : rule.points)
      end
      player.save!
    end

    ## Creating a lead is worth 1
    #player.points = (player.points || 0) + 1
    #player.save!
    #
    ## Add a lead phone: 1
    #player.points = player.points + (self.phone.nil? ? 0 : 1)
    #player.save!
    #
    ## Add a lead email: 1
    #player.points = player.points + (self.email.nil? ? 0 : 1)
    #player.save!
    #
    ## Add a lead note: 1
    #player.points = player.points + (self.notes.nil? ? 0 : 1)
    #player.save!
  end

  def lead_player
    self.player.attributes
  end

  def as_json(options={})
    super(options.merge(:methods => [:lead_player]))
  end

end
