class Team < ActiveRecord::Base

  has_many :players

  def points
    players.inject(0) { |sum, player| sum += player.points }
  end

end
