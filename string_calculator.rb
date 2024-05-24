class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    delimiter = ","
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2..-1]
      numbers = parts[1]
    end
    numbers = numbers.gsub("\n", delimiter)
    num_array = numbers.split(delimiter).map(&:to_i)
    negative_numbers = num_array.select { |num| num < 0 }
    unless negative_numbers.empty?
      raise "negative numbers not allowed: #{negative_numbers.join(',')}"
    end
    num_array.sum
  end
end