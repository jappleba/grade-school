require 'pry'
class School
  attr_accessor :db

  def initialize
    @db = {}
  end

  def add(name, class_number)
    #raised exception in case of 20 students already in the class
    raise "There are already 20 students in grade #{class_number}" if self.grade(class_number).length >= 20
    #sort the array of students each time a student is added. This makes the to_h method simpler.
    #this could be potentially inefficient, but given the simple nature of the code, I dont believe this is a problem.
    self.grade(class_number).push(name).sort!
  end

  def grade(class_number)
    #checks if the class_number exists and creates the class_number if does not exist
    self.db[class_number] ? self.db[class_number] : self.db[class_number] = []
  end

  def remove(name, class_number)
    #based on instructions included the class_number as an argument
    self.db[class_number].delete(name)
  end

  def graduate
    #immediately delete grade 8 of the hash as they are no longer in the school
    self.db.delete(8)
    #could not directly change the key of the hash so created a new hash in which class)number was increased by 1 and set the db to the new hash
    new_hash_array = self.db.map {|class_number, students| [class_number + 1, students]}
    self.db = Hash[new_hash_array]
  end

  def to_h
    #student arrays are already sorted so simply sorted the hash based on keys
    Hash[self.db.sort]
  end
end
