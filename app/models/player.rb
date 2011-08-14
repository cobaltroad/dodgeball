class Player < ActiveRecord::Base

  belongs_to :team
  has_many :leads
  has_many :sales

  def player_team
    if team.nil?
      nil
    else
      team.attributes.merge(:points => team.points)
    end
  end

  def player_leads
    leads.map(&:attributes)
  end

  def player_sales
    sales.map(&:attributes)
  end

  def as_json(options={})
    super(options.merge(:methods => [:player_team, :player_leads, :player_sales]))
  end

end
