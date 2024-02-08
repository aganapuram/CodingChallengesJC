file_content = ''
file_name = ''
# `ARGV` is a special global variable that holds the command-line arguments passed to a Ruby script.
input_array = ARGV
if (input_array.include?('-c') || 
    input_array.include?('-l') || 
    input_array.include?('-w') || 
    input_array.include?('-m')) && 
  # STDIN.tty? check if the standard input is interactively coming from the terminal.
  # eg: `cat test.txt | ruby ccwb.rb -c` here the input - text.txt is not being directly used as the standard input, rather the contents of the file are used an input.
  !STDIN.tty?
  # `$stdin` is a global variable that represents the standard input stream.
  # The use of $stdin in this context allows the script to read from the standard input, which is being provided through the pipe (|) from the cat command.
  file_content = $stdin.read
elsif input_array.length > 1 
  file_name = input_array[1]
  file_content = File.read(file_name)
elsif input_array.length > 0
  file_name = input_array[0]
  file_content = File.read(file_name)
end

lines = file_content.lines

if input_array.include?('-c')
  file_size = file_content.bytesize
  puts "#{file_size} #{file_name}" unless file_name.empty?
  puts "#{file_size}" if file_name.empty?
elsif input_array.include?('-l')
  lines_count = lines.count
  puts "#{lines_count} #{file_name}" unless file_name.empty?
  puts "#{lines_count}" if file_name.empty? 
elsif input_array.include?('-w')
  word_count =  file_content.split(/\s+/).length
  puts "#{word_count} #{file_name}" unless file_name.empty?
  puts "#{word_count}" if file_name.empty? 
elsif input_array.include?('-m')
  char_count = file_content.length
  puts "#{char_count} #{file_name}" unless file_name.empty?
  puts "#{char_count}" if file_name.empty?
else 
  lines_count = lines.count
  word_count = file_content.split(/\s+/).length
  file_size = file_content.bytesize
  puts "#{lines_count} #{word_count} #{file_size} #{file_name}" unless file_name.empty?
  puts "#{lines_count} #{word_count} #{file_size}" if file_name.empty?
end
