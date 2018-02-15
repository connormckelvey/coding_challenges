defmodule SubstrTest do
  use ExUnit.Case
  doctest Substr

  test "the truth" do
    Substr.find("democracy", 5)
    |> IO.inspect
  end

  test "the truth2" do
    Substr.find("wawagwlegeawe", 4)
    |> IO.inspect
  end
end
