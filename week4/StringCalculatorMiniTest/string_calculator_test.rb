# string_calculator_test.rb
require 'minitest/autorun'
require_relative 'string_calculator'

# class StringCalculataorTest
class StringCalculatorTest <Minitest::Test
  def test_add_two_numbers
    assert StringCalculator.add('2,4') == 6
  end

  def test_add_two_numbers2
    assert StringCalculator.add('17,100') == 117
  end
end
