class Pokemon
require 'pry'
attr_accessor :id, :name, :type, :db, :sql_runner, :hp

def initialize(name = @name, type = @type, db = @db, hp = nil)
  @name = name
  @type = type
  @db = db
end

  def self.save(name = @name, type = @type, db = @db, hp = @hp)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
end

def self.find(id = @id, db = @db)
  a = db.execute("SELECT * FROM pokemon WHERE id == #{id}")

  p = new(a[0][1], a[0][2], db, a[0][3])
  p.id = id
  p

end

def alter_hp(hp, db)
    self.hp = hp
end

end
