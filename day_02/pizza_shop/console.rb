require('pry-byebug')
require_relative('models/pizza_order')

order1 = PizzaOrder.new({
  "first_name" => "Ned",
  "last_name" => "Stark",
  "topping" => "frozen",
  "quantity" => "40"
  })

order1.save()

order2 = PizzaOrder.new({
  "first_name" => "The Mother",
  "last_name" => "of Dragons",
  "topping" => "well fired",
  "quantity" => "2"
  })

binding.pry
nil
