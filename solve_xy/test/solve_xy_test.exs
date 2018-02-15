defmodule SolveXyTest do
  use ExUnit.Case
  doctest SolveXy

  test "parse" do
    res = SolveXy.parse "x + y = 3"
    assert res == [["x", "+", "y"], ["3"]]

    res2 = SolveXy.parse "2*x + y = 4"
    assert res2 == [["2", "*", "x", "+", "y"], ["4"]]
  end
end
