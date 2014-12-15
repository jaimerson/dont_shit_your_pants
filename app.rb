require 'grimm'

Grimm::StoryTeller.new do
  book "Don't shit your pants" do
    prologue 'You really need to shit.'

    hero do
      pants_down false
      standing true
      door_open false
    end

    scenario :look_around, :look, :glance do
      go_back 'There is a door to your right.'
    end

    scenario :take_off_pants, :get_naked do
      hero.pants_down? true
      go_back 'You take off your pants.'
    end

    scenario :open_door, :pull_door do
      if hero.door_open?
        go_back 'The door is already open.'
      else
        hero.door_open? true
        go_back 'You open the door.'
      end
    end

    scenario :sit_toilet, :sit_on_toilet do
      if hero.door_open?
        hero.standing? false
        go_back 'You sit the toilet.'
      else
        go_back 'The door is closed.' unless hero.door_open?
      end
    end

    scenario :shit do
      return finish 'You shit your pants.' unless hero.pants_down?
      return finish 'You shit on the floor.' if hero.standing?
      finish 'You manage to shit properly.'
    end
  end
end.start
