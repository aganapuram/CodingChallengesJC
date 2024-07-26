def find_input_command(input_array)
  return '-c' if input_array.include?('-c')
  return '-l' if input_array.include?('-l')
  return '-w' if input_array.include?('-w')
  return '-m' if input_array.include?('-m')
  return 'invalid'
end

def file_size(file_content)
  file_content.bytesize
end

def lines_count(lines)
  lines.count
end

def word_count(file_content)
  file_content.split(/\s+/).length
end

def char_count(file_content)
  file_content.length
end

def print_info(count, file_name)
  puts "#{count} #{file_name}" unless file_name.empty?
  puts "#{count}" if file_name.empty?
end

def find_index_of_file_and_command(input_array)
  input = find_input_command(input_array[0])
  return [input, 1] if input != 'invalid'
  input = find_input_command(input_array[1])
  return [input, 0] if input != 'invalid'
end

file_content = ''
file_name = ''
input = ''
# `ARGV` is a special global variable that holds the command-line arguments passed to a Ruby script.
input_array = ARGV
if !STDIN.tty?
  # STDIN.tty? check if the standard input is interactively coming from the terminal.
  # eg: `cat test.txt | ruby ccwb.rb -c` here the input - text.txt is not being directly used as the standard input, rather the contents of the file are used an input.
  # `$stdin` is a global variable that represents the standard input stream.
  # The use of $stdin in this context allows the script to read from the standard input, which is being provided through the pipe (|) from the cat command.
  file_content = $stdin.read
elsif input_array.length > 1 
  command_index = find_index_of_file_and_command(input_array)
  input = command_index[0]
  file_name = input_array[command_index[1]]
  file_content = File.read(file_name)
elsif input_array.length > 0
  file_name = input_array[0]
  file_content = File.read(file_name)
end

lines = file_content.lines

case input
  when '-c'
    print_info(file_size(file_content), file_name)
  when '-l'
    print_info(lines_count(lines), file_name)
  when '-w'
    print_info(word_count(file_content), file_name)
  when '-m'
    print_info(char_count(file_content), file_name)
  else
    puts "#{lines_count(lines)} #{word_count(file_content)} #{file_size(file_content)} #{file_name}" unless file_name.empty?
    puts "#{lines_count(lines)} #{word_count(file_content)} #{file_size(file_content)}" if file_name.empty?
end
