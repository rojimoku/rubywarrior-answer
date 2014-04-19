class Player
  def play_turn(warrior)
    arrlook = warrior.look
    if warrior.feel.wall?
      warrior.pivot!
    elsif warrior.feel.captive?
      warrior.rescue!
    elsif @rest == true && warrior.health >= @health
      warrior.rest!
      if warrior.health == 20
        @rest = false
      end
    elsif arrlook[2].enemy?
      if warrior.feel.enemy?
        warrior.attack!
      else
        warrior.shoot!
      end
    elsif warrior.feel.empty?
      if warrior.health < 10
        if warrior.health < @health
          warrior.walk!(:backward)
        else
          warrior.rest!
          @rest = true
        end
      else
        warrior.walk!
      end
    else
      warrior.attack!
    end
    @health = warrior.health
  end  
end