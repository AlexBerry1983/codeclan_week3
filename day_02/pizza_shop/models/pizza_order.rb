require('pg')

class PizzaOrder
  attr_accessor :first_name, :last_name, :topping, :quantity
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @first_name = params['first_name']
    @last_name = params['last_name']
    @topping = params['topping']
    @quantity = params['quantity'].to_i
  end

  def save()
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql =
    "INSERT INTO pizza_orders (
      first_name,
      last_name,
      topping,
      quantity
    ) VALUES (
      '#{@first_name}',
      '#{@last_name}',
      '#{@topping}',
      #{@quantity}
    ) RETURNING *;"
    @id = db.exec(sql).first()['id'].to_i()
    db.close()
  end

  def delete()
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "DELETE FROM pizza_orders WHERE id=#{@id}"
    db.exec(sql)
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "UPDATE pizza_orders SET (first_name, last_name, topping, quantity) =
    ('#{@first_name}', '#{@last_name}', '#{@topping}', #{@quantity})
    WHERE id=#{@id};"
    db.exec(sql)
    db.close()
  end

  def PizzaOrder.all()
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "SELECT * FROM pizza_orders;"
    result = db.exec(sql)
    db.close()
    return result.map { |pizza_order| PizzaOrder.new(pizza_order)}
  end

  def PizzaOrder.delete_all()
    db = PG.connect({dbname: 'pizza_shop', host: 'localhost'})
    sql = "DELETE FROM pizza_orders;"
    db.exec(sql)
    db.close()
  end

end
