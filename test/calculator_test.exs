defmodule CalculatorTest do
  use ExUnit.Case
  alias PairSession.Calculator
  
  describe "Given the user input is empty when calculating the sum then it should return zero" do
    assert Calculator.sum() === 0
  end
  
  describe "Given the user input is one number when calculating the sum then it should return the same number. (example '3' should equal 3)" do
    assert Calculator.sum("3") === 3
  end

  describe "Given the user input is two numbers when calculating the sum then it should return the sum of those numbers. (example '1,2' should equal 3)" do
    assert Calculator.sum("1,2") === 3
  end

  describe "Given the user input is an unknown amount of numbers when calculating the sum then it should return the sum of all the numbers. (example '1,2,3' should equal 6)" do
    assert Calculator.sum("1,2,3") === 6
  end

  describe "Given the user input is multiple numbers with new line and comma delimiters when calculating the sum then it should return the sum of all the numbers. (example '1\n2,3' should equal 6)" do
    assert Calculator.sum("1\n2,3") === 6
  end

  describe "Given the user input is multiple numbers with a custom single-character delimiter when calculating the sum then it should return the sum of all the numbers. (example '//;\n1;2' should return 3)" do
    assert Calculator.sum("//;\n1;2") === 3
  end
end