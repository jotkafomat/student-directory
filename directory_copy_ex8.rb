def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #while the name is not empty,  repeat this code
  while !name.empty? do
    #add students hash to the array
    students << {name: name, cohort: :novemer}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts " #{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_students_begings_with_letter_D(students)
  students.each_with_index do |student, index|
      if student[:name][0] == "D"
        puts " #{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
  end
end

def print_students_with_short_name(students)
  students.each_with_index do |student, index|
      if student[:name].length < 12
        puts " #{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
      end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)
puts "Students whose name starts with letter D"
print_students_begings_with_letter_D(students)
puts "Students whose name is shorter then 12 charakters"
print_students_with_short_name(students)
