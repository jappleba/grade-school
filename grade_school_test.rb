#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'grade_school'

class SchoolTest < Minitest::Test
  attr_reader :school

  def setup
    @school = School.new
  end

  def test_an_empty_school
    assert_equal({}, school.to_h)
  end

  def test_add_student
    school.add('Aimee', 2)
    assert_equal({ 2 => ['Aimee'] }, school.to_h)
  end

  def test_add_more_students_in_same_class
    school.add('Blair', 2)
    school.add('James', 2)
    school.add('Paul', 2)
    assert_equal({ 2 => %w(Blair James Paul) }, school.to_h)
  end

  def test_add_students_to_different_grades
    school.add('Chelsea', 3)
    school.add('Logan', 7)
    assert_equal({ 3 => ['Chelsea'], 7 => ['Logan'] }, school.to_h)
  end

  def test_get_students_in_a_grade
    school.add('Bradley', 5)
    school.add('Franklin', 5)
    school.add('Jeff', 1)
    assert_equal %w(Bradley Franklin), school.grade(5)
  end

  def test_get_students_sorted_in_a_grade
    school.add('Franklin', 5)
    school.add('Bradley', 5)
    school.add('Jeff', 1)
    assert_equal %w(Bradley Franklin), school.grade(5)
  end

  def test_get_students_in_a_non_existant_grade
    assert_equal [], school.grade(1)
  end

  def test_sort_school
    [
      ['Jennifer', 4], ['Kareem', 6],
      ['Christopher', 4], ['Kyle', 3]
    ].each do |name, grade|
      school.add(name, grade)
    end
    sorted = {
      3 => ['Kyle'],
      4 => %w(Christopher Jennifer),
      6 => ['Kareem']
    }
    assert_equal sorted, school.to_h
    assert_equal [3, 4, 6], school.to_h.keys
  end

  def test_remove_student
    [
      ['Jennifer', 4], ['Kareem', 6],
      ['Christopher', 4], ['Kyle', 3]
    ].each do |name, grade|
      school.add(name, grade)
    end

    school.remove('Kareem', 6)
    school.remove('Jennifer', 4)
    assert_equal [], school.db[6]
    assert_equal ['Christopher'], school.db[4]
  end

  def test_graduate_students
    [
      ['Jennifer', 4], ['Kareem', 6],
      ['Christopher', 4], ['Kyle', 3],
      ['John', 8], ['Jake', 8]
    ].each do |name, grade|
      school.add(name, grade)
    end
    school.graduate
    assert_equal ['Christopher', 'Jennifer'], school.db[5]
    assert_equal ['Kareem'], school.db[7]
    assert_equal nil, school.db[8]
    assert_equal nil, school.db[9]
  end

  def test_max_students_per_grade
    #kept this simple and did not use a gem like Faker to generate names
    #did want to generate different names though as this reflects the assumptions provided in the scenario
    letter = "a"
    20.times do
      school.add(letter.next, 4)
      letter = letter.next
    end
    assert_raises(Exception)  {school.add("z", 4)}
  end

end
