require 'pry'
class School
  #changed to read and write the db since db will need to be updated
  attr_accessor :db

  def initialize
    @db = {}
  end

  def add(name, class_number)
    self.grade(class_number).push(name)
  end

  def grade(class_number)
    #changed to check if the grade exists and create grade if it does not
    @db[class_number] ? @db[class_number] : @db[class_number] = []
  end

  def to_h
    sorted_db = @db.map do |class_number, students|
      students.sort!
    end
    binding.pry
    Hash[sorted_db]
  end
end
