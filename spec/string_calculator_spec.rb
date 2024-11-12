require './lib/string_calculator'

RSpec.describe StringCalculator do
  let(:string_calculator) { StringCalculator.new }

  it 'should get sum of comma separated numbers' do
    expect(string_calculator.add('1,2,3')).to eq(6)
  end

  it 'should get sum as 0 for empty input' do
    expect(string_calculator.add('')).to eq(0)
  end

  it 'should get sum for input without comma separated numbers' do
    expect(string_calculator.add('12')).to eq(12)
  end

  it 'should get sum for large numbers' do
    expect(string_calculator.add('1,2,3,8,8,10,7,8,10')).to eq(57)
  end

  it 'should get error for non string value' do
    expect(string_calculator.add(1)).to eq('Input must be a string')
  end

end