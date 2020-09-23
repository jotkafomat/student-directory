
def read_its_own_code
  File.foreach("directory_exercise14_8.rb") { |line| puts line }
end
read_its_own_code
