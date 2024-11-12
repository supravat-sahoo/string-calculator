class StringCalculator
  def add(str)
    return "Input must be a string" unless str.is_a?(String)

    return 0 if str.empty?

    # Split the string by commas and convert each part to an integer
    # str.split(',').map(&:to_i).sum
    
    # Allow the add method to handle new lines between numbers (instead of commas). 
    # str.split(/,|\n/).map(&:to_i).sum

    # Support different delimiters\
    # Check for a custom delimiter at the beginning of the string
    if str.start_with?("//")
      delimiter, str = extract_custom_delimiter(str)
    else
      delimiter = /,|\n/  # Default delimiters: comma or newline
    end

    # str.split(delimiter).map(&:to_i).sum

    # Split the numbers and map them to integers
    numbers_array = str.split(delimiter).map(&:to_i)

    # Check for negative numbers
    negatives = numbers_array.select { |num| num < 0 }

    if negatives.any?
      return "Negative numbers not allowed: #{negatives.join(', ')}"
    end

    # Return the sum if no negative numbers
    numbers_array.sum
  end

  private

  # Method to extract the custom delimiter and the rest of the string
  def extract_custom_delimiter(numbers)
    # Match and capture the custom delimiter
    match_data = numbers.match(%r{//(.+)\n(.*)})
    delimiter = Regexp.escape(match_data[1])  # Escape to handle special characters
    numbers = match_data[2]                  # The rest of the string
    [delimiter, numbers]
  end
end