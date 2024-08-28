# frozen_string_literal: true

# class to read a file's content line by line.
# and provide file utilit information.
class FileContent
  def initialize(file_content)
    @file_content = file_content
  end

  def size
    @file_content.bytesize
  end

  def lines_count
    lines = @file_content.lines
    lines.count
  end

  def word_count
    @file_content.split(/\s+/).length
  end

  def char_count
    @file_content.length
  end
end
