defmodule Ponds do
  @matrix [[0, 2, 1, 0],
           [0, 1, 0, 1],
           [1, 1, 0, 1],
           [0, 1, 0, 1]]

  def get_matrix do
    @matrix
  end

  def is_water?(row, col) do
    @matrix
    |> Enum.at(row)
    |> Enum.at(col) == 0
  end

  def are_connected?(coord_1, coord_2) do
    # IO.inspect { coord_1, coord_2 }
    row_diff = abs(elem(coord_1, 0) - elem(coord_2, 0))
    col_diff = abs(elem(coord_1, 1) - elem(coord_2, 1))
    # IO.inspect row_diff
    # IO.inspect col_diff
    case {row_diff, col_diff} do
      {0, 1} -> true
      {1, 0} -> true
      {1, 1} -> true
      _ -> false
    end
  end


  def find_pond(coords) do
    [head | tail] = head
    tail
    |> Enum.with_index
    |> Enum.reduce([head], fn({coord, index}) ->

    end)
    pond = [head] ++ (tail |>
    Enum.filter(fn(coord) -> are_connected?(head, coord) end))

    # find_pond(tail, part)
  end


  def find_water(matrix) do
    matrix |> Enum.with_index |> Enum.flat_map(fn({row, outer_index}) ->
      row |> Enum.with_index |> Enum.reduce([], fn({col, inner_index}, acc) ->
        if is_water? outer_index, inner_index do
          acc ++ [{outer_index, inner_index}]
        else
          acc
        end
      end)
    end)
  end

  def count do
    @matrix
    |> find_water
    |> find_pond
    |> IO.inspect
  end
end
