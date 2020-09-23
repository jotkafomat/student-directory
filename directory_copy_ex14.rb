
require 'csv'
@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    #input the students
    puts "You've selected option nr 1 - 'Input the students'"
    students = input_students
  when "2"
    # show the students
    puts "You've selected option nr 2 - 'Show the students'"
    show_students
  when "3"
    puts "You've selected option nr 3 - 'Save the students'"
    save_students
  when "4"
    puts "You've selected option nr 4 - 'Load the students from file'"
    load_students
  when "9"
    puts "Bye"
    exit #this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  #while the name is not empty,  repeat this code
  while !name.empty? do
    #add students hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  puts "Where fo you want to save your list (default file is: students.csv)"
  filename = STDIN.gets.chomp
  if filename == ""
    filename = "students.csv"
  end
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data
      csv << csv_line
    end
  end
end

def load_students(filename = "students.csv")
  puts "Your default file to load from is #{filename}. If you want to load from a different file put a new name:"
  filename = STDIN.gets.chomp
  if filename == ""
    filename = "students.csv"
  end
  CSV.foreach(filename) do |line|
    name, cohort = line
    @students << {name: name, cohort: cohort.to_sym}
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end

try_load_students
interactive_menu
