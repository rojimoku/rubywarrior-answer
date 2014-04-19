class Player
  def play_turn(warrior)
    if warrior.feel.wall?
      warrior.pivot!
    elsif @rest == true && warrior.health >= @health
      warrior.rest!
      if warrior.health == 20
        @rest = false
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