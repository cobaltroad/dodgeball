class Sale < ActiveRecord::Base

  belongs_to :player
  #has_many :logs

  validates_presence_of :player

  after_save :update_points

  def update_points
    player = self.player

    player.points = (player.points || 0) + 1
    player.save!

    #Successful contact: log entry: phone/email/visit: +1 points
    #after 5 log entry: +5 points

    #Positive customer feed back: 5point
    player.points = player.points + (self.positive_feedback? ? 5 : 0)
    player.save!

    #Close: product 1 $1,000 : 5
    player.points = player.points + (self.sale_amount_in_cents > 100000 ? 5 : 0)
    player.save!

    #Close: product 2 $5,000 : 25
    player.points = player.points + (self.sale_amount_in_cents > 100000 ? 20 : 0)
    player.save!

    #Close: product 3 $10,000: 50
    player.points = player.points + (self.sale_amount_in_cents > 100000 ? 25 : 0)
    player.save!
  end

  def sale_player
    player.attributes
  end

  def as_json(options={})
    super(options.merge(:methods => [:sale_player]))
  end

end
