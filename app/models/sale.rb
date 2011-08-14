class Sale < ActiveRecord::Base

  belongs_to :player
  #has_many :logs

  validates_presence_of :player

  after_save :update_points

  def update_points
    player = self.player

    # TODO: Move this to a class method in rules

    Rule.find_all_by_object_type("sale").each do |rule|
      points = (player.points || 0)
      case rule.rule_type
        when "creation"
          player.points = points + rule.points
        when "presence"
          player.points = points + (self.send(rule.trigger).nil? ? 0 : rule.points)
        when "threshold"
          player.points = points + ((self.send(rule.trigger) > rule.threshold) ? rule.points : 0)
        when "boolean"
          player.points = points + ((self.send(rule.trigger) == true) ? rule.points : 0)
      end
      player.save!
    end

    #player.points = (player.points || 0) + 1
    #player.save!

    #Successful contact: log entry: phone/email/visit: +1 points
    #after 5 log entry: +5 points

    #Positive customer feed back: 5point
    #player.points = player.points + (self.positive_feedback? ? 5 : 0)
    #player.save!

    ##Close: product 1 $1,000 : 5
    #player.points = player.points + (self.sale_amount_in_cents > 100000 ? 5 : 0)
    #player.save!

    #Close: product 2 $5,000 : 25
    #player.points = player.points + (self.sale_amount_in_cents > 100000 ? 20 : 0)
    #player.save!

    #Close: product 3 $10,000: 50
    #player.points = player.points + (self.sale_amount_in_cents > 100000 ? 25 : 0)
    #player.save!
  end

  def sale_player
    player.attributes
  end

  def as_json(options={})
    super(options.merge(:methods => [:sale_player]))
  end

end
