require('pg')

class Cowboy

  attr_accessor :name, :bounty_value, :danger_value, :favourite_weapon
  attr_reader :id
  def initialize(params)
    @id = params["id"].to_i if params['id']
    @name = params["name"]
    @bounty_value = params["bounty_value"].to_i
    @danger_value = params["danger_value"]
    @favourite_weapon = params["favourite_weapon"]
  end


  def save
    db = PG.connect({ dbname: "space_cowboys", host: "localhost" })
    sql = "INSERT INTO space_cowboys(name, bounty_value, danger_value, favourite_weapon)
      VALUES ('#{@name}', #{@bounty_value}, '#{@danger_value}', '#{@favourite_weapon}')
      RETURNING *;"
    result = db.exec(sql)
    @id = result.first["id"].to_i
    db.close
  end

  def update
    db = PG.connect({dbname: "space_cowboys", host:"localhost"})
    sql = "
    UPDATE space_cowboys SET (name, bounty_value, danger_value, favourite_weapon) =
    ('#{@name}', #{@bounty_value}, '#{@danger_value}', '#{@favourite_weapon}')
    WHERE id=#{@id};"
    db.exec(sql)
    db.close()
  end

  def delete
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "
    DELETE FROM space_cowboys
    WHERE id=#{@id}"
    db.exec(sql)
    db.close()
  end

  def Cowboy.find(id)
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "
    SELECT * FROM space_cowboys
    WHERE id=#{id}"
    result = db.exec(sql)
    db.close()
    return Cowboy.new(result.first)
  end

  def Cowboy.all()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "
    SELECT * FROM space_cowboys"
    result = db.exec(sql)
    db.close
    return result.map { |cowboy_hash| Cowboy.new(cowboy_hash) }
  end

  def Cowboy.delete_all()
    db = PG.connect({dbname: "space_cowboys", host: "localhost"})
    sql = "
    DELETE FROM space_cowboys"
    db.exec(sql)
    db.close()
  end

end
