require 'pry'
class School
  attr_accessor :db

  def initialize
    @db = {}
  end

  def add(name, class_number)
    self.grade(class_number).push(name).sort!
  end

  def grade(class_number)
    @db[class_number] ? @db[class_number] : @db[class_number] = []
  end

  def to_h
    sorted_array = @db.map do |class_number, students|
        [class_number,  students]
    end.sort_by{|x| x[0]}
    Hash[sorted_array]
  end
end
