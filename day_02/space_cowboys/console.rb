require('pry-byebug')
require_relative('models/cowboy.rb')

cowboy1 = Cowboy.new({
  'name' => 'John Wayne',
  'bounty_value' => '100',
  'danger_value' => 'low',
  'favourite_weapon' => 'six_shooter'
  })

cowboy2 = Cowboy.new({
  'name' => 'Henry Nelson',
  'bounty_value' => '900',
  'danger_value' => 'high',
  'favourite_weapon' => 'long_rifle'
  })

cowboy2.save()
cowboy1.save()

binding.pry
nil
