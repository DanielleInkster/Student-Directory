@students = []

def input_students
  puts "Please enter the name of the student".center(75)
  puts "To finish, just hit return twice".center(75)

  name = gets.chop

  while !name.empty? do
    puts "Please enter the cohort".center(75)
    cohort = gets.chop
    if cohort.empty?
      cohort = "TBD"
    end

    @students << {name: name, cohort: cohort}
    if @students.count == 1
    puts "Now we have #{@students.count} student".center(75)
  else
    puts "Now we have #{@students.count} students".center(75)
  end
  puts "Please enter the name of the next student".center(75)
    name = gets.chop
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def process(selection)
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again?"
end
end

def print_header
  puts "The students of Villains Academy".center(75)
  puts '-------------'.center(75)
end

def print_student_list
  if @students.length > 0
    @students.each do |student|
    puts "#{student[:name].capitalize} (#{student[:cohort].capitalize} cohort).".center(75)
  end
else puts "No students".center(75)
end
end

def print_footer
puts "Overall, we have #{@students.count} great students".center(75)
end


interactive_menu
