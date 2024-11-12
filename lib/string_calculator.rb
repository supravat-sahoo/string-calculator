class StringCalculator
  def add(str)
    raise ArgumentError, "Input must be a string" unless str.is_a?(String)

    # Return 0 for empty string
    return 0 if str.empty?

    # Check for a custom delimiter at the beginning of the string
    if str.start_with?("//")
      delimiter, str = extract_custom_delimiter(str)
    else
      delimiter = /,|\n/  # Default delimiters: comma or newline
    end

    # Split the numbers, map to integers, and check for negative numbers in one pass
    numbers_array = str.split(delimiter).map(&:to_i)
    negatives = numbers_array.select { |num| num < 0 }

    # Raise an exception if there are negative numbers
    raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    # Return the sum of the numbers
    numbers_array.sum
  end

  private

  def extract_custom_delimiter(str)
    # Capture custom delimiter and numbers using a single regex match
    match_data = str.match(%r{//(.+)\n(.*)})
    delimiter = Regexp.escape(match_data[1])  # Escape to handle special characters
    [delimiter, match_data[2]]  # Return delimiter and the rest of the string
  end
end