file_content = ''
file_name = ''
input_array = ARGV
if (input_array.include?('-c') || 
    input_array.include?('-l') || 
    input_array.include?('-w') || 
    input_array.include?('-m')) && 
  !STDIN.tty?
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
