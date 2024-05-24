class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    delimiters = [",", "\n"]
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter_part = parts[0][2..-1]
      if delimiter_part.start_with?("[") && delimiter_part.end_with?("]")
        delimiters += delimiter_part[1..-2].split("][")
      else
        delimiters << delimiter_part
      end
      numbers = parts[1]
    end

    delimiter_regex = Regexp.union(delimiters)
    num_array = numbers.split(delimiter_regex).map(&:to_i)

    negative_numbers = num_array.select { |num| num < 0 }
    unless negative_numbers.empty?
      raise "negative numbers not allowed: #{negative_numbers.join(',')}"
    end
    num_array.sum
  end
end