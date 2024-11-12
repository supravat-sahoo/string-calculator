require './lib/string_calculator'

RSpec.describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  describe '#add' do
    context 'when the input is a comma-separated list of numbers' do
      it 'returns the sum of the numbers' do
        expect(string_calculator.add("1,2,3")).to eq(6)
      end

      it 'returns the sum for large numbers' do
        expect(string_calculator.add("1,2,3,8,8,10,7,8,10")).to eq(57)
      end
    end

    context 'when the input is empty' do
      it 'returns 0' do
        expect(string_calculator.add("")).to eq(0)
      end
    end

    context 'when the input is a single number without commas' do
      it 'returns the number itself' do
        expect(string_calculator.add("12")).to eq(12)
      end
    end

    context 'when the input is non-string' do
      it 'raises an ArgumentError with appropriate message' do
        expect { string_calculator.add(123) }.to raise_error(ArgumentError, "Input must be a string")
        expect { string_calculator.add([]) }.to raise_error(ArgumentError, "Input must be a string")
        expect { string_calculator.add(nil) }.to raise_error(ArgumentError, "Input must be a string")
      end
    end

    context 'when the input contains new lines' do
      it 'handles new line and comma-separated numbers' do
        expect(string_calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when the input contains custom delimiters' do
      it 'handles custom delimiters correctly' do
        expect(string_calculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when the input contains negative numbers' do
      it 'raises an ArgumentError with a list of negative numbers' do
        expect { string_calculator.add("1,-2,3") }.to raise_error(ArgumentError, "Negative numbers not allowed: -2")
        expect { string_calculator.add("1,-2,-3") }.to raise_error(ArgumentError, "Negative numbers not allowed: -2, -3")
      end
    end
  end
end