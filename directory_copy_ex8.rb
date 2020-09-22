def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  #while the name is not empty,  repeat this code
  while !name.empty? do
    #ask for cohort
    puts "Please enter the cohort of the student"
    #get the cohort
    cohort = gets.chomp.to_sym
    #check chohort
    if cohort == ""
      cohort = :november
    end
    #add students hash to the array
    students << {name: name, cohort: cohort, hobbies: :cycling, country: :UK, height: :"181" }
    puts "Now we have #{students.count}" + "#{students.count == 1 ? " student" : " students"}"
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
    puts " #{index + 1}. #{student[:name]} (#{student[:cohort]} cohort, #{student[:hobbies]} hobby, from #{student[:country]}, #{student[:height]} cm )".center(100)
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

def print_with_while(students)
  student_number = 1
  student_index = 0
  while students.length > student_index
    puts "#{student_number}. #{students[student_index][:name]} (#{students[student_index][:cohort]} cohort)"
    student_number += 1
    student_index += 1
  end
end

def print_with_map_cohort(students)
  student_number = 1
  students.map {|student| student[:cohort] == :may }.each do |student|
    puts "#{student_number}. #{student[:name]} (#{student[:cohort]} cohort)"
    student_number += 1
  end
end

def print_one_cohort(students)
   students.select {|student| student[:cohort] == :may}.each_with_index {|student, index| puts " #{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer(students)
  puts "Now we have #{students.count}" + "#{students.count == 1 ? " student" : " students"}"
end
students = input_students
print_header
print_with_while(students)
print_footer(students)
puts "Students whose name starts with letter D"
print_students_begings_with_letter_D(students)
puts "Students whose name is shorter then 12 charakters"
print_students_with_short_name(students)
print(students)
print_one_cohort(students)
