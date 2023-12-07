# spec/models/example_spec.rb

RSpec.describe 'Example' do
  it 'adds two numbers' do
    result = 2 + 3
    expect(result).to eq(5)
  end

  it 'checks if a string is not empty' do
    string = 'Hello, World!'
    expect(string).not_to be_empty
  end

  it 'compares two arrays' do
    array1 = [1, 2, 3]
    array2 = [1, 2, 3]
    expect(array1).to eq(array2)
  end
end
