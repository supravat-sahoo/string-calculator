class StringCalculator
  def add(str)
    raise ArgumentError, "Input must be a string" unless str.is_a?(String)

    return 0 if str.empty?

    # Check for a custom delimiter at the beginning of the string
    if str.start_with?("//")
      delimiter, str = extract_custom_delimiter(str)
    else
      delimiter = /,|\n/  # Default delimiters: comma or newline
    end

    # Split the numbers using the custom delimiter or default and map them to integers
    numbers_array = str.split(delimiter).map(&:to_i)

    # Check for negative numbers
    negatives = numbers_array.select { |num| num < 0 }

    if negatives.any?
      raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}"
    end

    # Return the sum if no negative numbers
    numbers_array.sum
  end

  private

  # Method to extract the custom delimiter and the rest of the string
  def extract_custom_delimiter(numbers)
    # Match and capture the custom delimiter and numbers part
    match_data = numbers.match(%r{//(.*?)\n(.*)})

    # Extract the delimiter (which could be multiple characters)
    delimiter = match_data[1]

    # Escape the delimiter to handle special characters correctly
    escaped_delimiter = Regexp.escape(delimiter)

    # The rest of the string (numbers after the custom delimiter)
    numbers = match_data[2]

    # Build the regex dynamically based on the escaped delimiter
    delimiter_regex = /#{escaped_delimiter}/

    [delimiter_regex, numbers]
  end
end
