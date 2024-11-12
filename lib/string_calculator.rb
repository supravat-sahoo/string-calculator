class StringCalculator
  def add(str)
    return "Input must be a string" unless str.is_a?(String)

    return 0 if str.empty?

    # Split the string by commas and convert each part to an integer
    # str.split(',').map(&:to_i).sum
    
    # Allow the add method to handle new lines between numbers (instead of commas). 
    str.split(/,|\n/).map(&:to_i).sum
  end
end