require_relative '../../days/day1/day1_1'
require 'rspec'

class Day1_1Spec
  describe "day1_1" do
    describe "grab_first_number" do
      [ {input: '1abc2', expected: '1'},
        {input: 'pqr3stu8vwx' , expected: '3'},
        {input: 'a1b2c3d4e5f', expected: '1'},
        {input: 'treb7uchet', expected: '7'}
      ].each do |example|
        it "should return #{example[:expected]} for #{example[:input]}" do
          expect(grab_first_number(example[:input])).to eq(example[:expected])
        end
      end
    end

    describe "grab_last_number" do
      [ {input: '1abc2', expected: '2'},
        {input: 'pqr3stu8vwx' , expected: '8'},
        {input: 'a1b2c3d4e5f', expected: '5'},
        {input: 'treb7uchet', expected: '7'}
      ].each do |example|
        it "should return #{example[:expected]} for #{example[:input]}" do
          expect(grab_last_number(example[:input])).to eq(example[:expected])
        end
      end
    end
  end
end