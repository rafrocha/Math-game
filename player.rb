class Player
  attr_accessor :name, :hp
  @@hp = 3

  def initialize(name)
    @name = name
    @hp = @@hp
  end

  def loose_hp
    @hp -= 1
  end
end
