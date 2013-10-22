class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greeting
    puts "Hi, my name is #{@name}!"
  end
end

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object."
  end
end

chris = Instructor.new("Chris")
christina = Student.new("Christina")
chris.greeting
christina.greeting
chris.teach
christina.learn

christina.teach
#calling the 'teach' methd on christina is returning an error because that method is only accessible to the Instructor class.  