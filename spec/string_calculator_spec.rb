require './lib/string_calculator'

RSpec.describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  context 'add' do
    it 'should get sum of comma separated numbers' do
      expect(string_calculator.add("1,2,3")).to eq(6)
    end

    it 'should get sum as 0 for empty input' do
      expect(string_calculator.add("")).to eq(0)
    end

    it 'should get sum for input without comma separated numbers' do
      expect(string_calculator.add("12")).to eq(12)
    end

    it 'should get sum for large numbers' do
      expect(string_calculator.add("1,2,3,8,8,10,7,8,10")).to eq(57)
    end

    it 'should get error for non string value' do
      expect(string_calculator.add(1)).to eq('Input must be a string')
    end
  end

  context 'add with new line' do
    it 'should get response for input with new line as well' do
      expect(string_calculator.add("1\n2,3")).to eq(6)
    end
  end

  context 'add with different delimiters' do
    it 'should get response for input with new delimiters as well' do
      expect(string_calculator.add("//;\n1;2")).to eq(3)
    end 
  end


  context 'add with negative numbers' do
    it 'should get error for negative input' do
      expect(string_calculator.add("1,-2,3")).to eq('Negative numbers not allowed: -2')
      expect(string_calculator.add("1,-2,-3")).to eq('Negative numbers not allowed: -2, -3')
    end 
  end

end