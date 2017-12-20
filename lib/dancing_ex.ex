defmodule DancingEx do
  @programs ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"]

  def s(list, arg) do
    # Spin, written sX, makes X programs move from the end to the front, but maintain their order otherwise. (For example, s3 on abcde produces cdeab).
    list
    |> Enum.split(length(list) - String.to_integer(arg))
    |> Tuple.to_list()
    |> Enum.reverse()
    |> List.flatten()
  end

  def x(list, arg) do
    # Exchange, written xA/B, makes the programs at positions A and B swap places.
    
    parts = String.split(arg, "/")
    a = String.to_integer(Enum.at(parts, 0))
    b = String.to_integer(Enum.at(parts, 1))
    
    a_val = Enum.at(list, a)
    b_val = Enum.at(list, b)

    list
    |> List.replace_at(a, b_val)
    |> List.replace_at(b, a_val)
  end

  def p(list, arg) do
    #Partner, written pA/B, makes the programs named A and B swap places.

    parts = String.split(arg, "/")
    a = Enum.at(parts, 0)
    b = Enum.at(parts, 1)
    
    a_index = Enum.find_index(list, fn(x) -> x == a end)
    b_index = Enum.find_index(list, fn(x) -> x == b end)

    list
    |> List.replace_at(a_index, b)
    |> List.replace_at(b_index, a)
  end

  def parse_fn(s) do
    case s do
      "s" <> rest ->
        {&s/2, rest}
      "x" <> rest ->
        {&x/2, rest}
      "p" <> rest ->
        {&p/2, rest}
    end
  end

  def main do
    input = DancingEx.Input.get()
    |> String.split(",")
    |> Enum.map(fn(x) -> parse_fn(x) end)
    
    Enum.reduce(1..1000000000, @programs, fn(n, acc) -> 
      Enum.reduce(input, acc, fn(x, a) -> 
        func = elem(x, 0)
        args = elem(x, 1)
        func.(a, args)
      end)  
    end) |> IO.inspect
  end
end
