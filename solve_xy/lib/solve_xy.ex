defmodule SolveXy do
  def parse_side(part) do
    part
    |> String.split("")
    |> Enum.filter(fn(c) -> c != " " && c != "" end)
  end

  def parse(eq) do
    [left, right] = String.split(eq, "=")
    [String.trim(left) |> parse_side, String.trim(right) |> parse_side]
  end

  def solve(str) do
    eqs = String.split str, ","

    eqs
    |> List.first
    |> parse
  end
end
