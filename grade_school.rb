require 'pry'
class School
  attr_accessor :db

  def initialize
    @db = {}
  end

  def add(name, class_number)
    raise "There are already 20 students in grade #{class_number}" if self.grade(class_number).length >= 20
    self.grade(class_number).push(name).sort!
  end

  def grade(class_number)
    self.db[class_number] ? self.db[class_number] : self.db[class_number] = []
  end

  def remove(name, class_number)
    self.db[class_number].delete(name)
  end

  def graduate
    self.db.delete(8)
    new_hash_array = self.db.map {|class_number, students| [class_number + 1, students]}
    self.db = Hash[new_hash_array]
  end

  def to_h
    sorted_array = self.db.sort
    Hash[sorted_array]
  end
end
