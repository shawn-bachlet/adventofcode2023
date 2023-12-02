require_relative '../../days/day1/day1_2'
require 'rspec'

class Day1_2Spec 
  describe 'Day1_2' do
    describe '#grab_first_digit_number' do
      [ { input: 'two1nine', expected: [1, 3] },
        { input: 'eightwothree', expected: nil },
        { input: 'abcone2threexyz', expected: [2, 6] },
        { input: 'xtwone3four', expected: [3, 6] },
        { input: '4nineeightseven2', expected: [4, 0] },
        { input: 'zoneight234', expected: [2, 8] },
        { input: '7pqrstsixteen' , expected: [7, 0] }
    ].each do |example|
        it "should return #{example[:expected]} for #{example[:input]}" do
          expect(grab_first_digit_number(example[:input])).to eq(example[:expected])
        end
      end
    end

    describe '#grab_first_text_number' do
      [ { input: 'two1nine', expected: [2, 0] },
        { input: 'eightwothree', expected: [8, 0] },
        { input: 'abcone2threexyz', expected: [1, 3] },
        { input: 'xtwone3four', expected: [2, 1] },
        { input: '4nineeightseven2', expected: [9, 1] },
        { input: 'zoneight234', expected: [1, 1] },
        { input: '7pqrstsixteen' , expected: [6, 6] }
    ].each do |example|
        it "should return #{example[:expected]} for #{example[:input]}" do
          expect(grab_first_text_number(example[:input])).to eq(example[:expected])
        end
      end
    end

    describe '#grab_first_number' do
      [ { input: 'two1nine', expected: 2 },
        { input: 'eightwothree', expected: 8 },
        { input: 'abcone2threexyz', expected: 1 },
        { input: 'xtwone3four', expected: 2 },
        { input: '4nineeightseven2', expected: 4 },
        { input: 'zoneight234', expected: 1 },
        { input: '7pqrstsixteen' , expected: 7 }
      ].each do |example|
        it "should return #{example[:expected]} for #{example[:input]}" do
          expect(grab_first_number(example[:input])).to eq(example[:expected])
        end
      end

      describe '#grab_last_number' do
        [ { input: 'two1nine', expected: 9 },
          { input: 'eightwothree', expected: 3 },
          { input: 'abcone2threexyz', expected: 3 },
          { input: 'xtwone3four', expected: 4 },
          { input: '4nineeightseven2', expected: 2 },
          { input: 'zoneight234', expected: 4 },
          { input: '7pqrstsixteen' , expected: 6 }
        ].each do |example|
          it "should return #{example[:expected]} for #{example[:input]}" do
            expect(grab_last_number(example[:input])).to eq(example[:expected])
          end
        end
      end
    end
  end
end