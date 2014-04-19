class Player
  def play_turn(warrior)
    if @flag != true
      if warrior.feel(:backward).empty?
        warrior.walk!(:backward)
      else
        warrior.rescue!(:backward)
        @flag = true
      end
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
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      warrior.attack!
    end
    @health = warrior.health
  end  
end