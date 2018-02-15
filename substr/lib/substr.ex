defmodule Substr do
  def get_substrs_of_len(str, len, substrs_list \\ []) do
    str_len = String.length(str)
    tail = String.slice(str, 1, str_len)
    substr = String.slice(str, 0, len)
    if str_len < 5 do
      substrs_list
    else
      get_substrs_of_len(tail, len, substrs_list ++ [substr])
    end
  end

  def find(str, len) do
    get_substrs_of_len(str, len)
    |> Enum.filter(fn(substr) ->
      set = substr
      |> String.split("", trim: true)
      |> MapSet.new()

      MapSet.size(set) == len || MapSet.size(set) == len - 1
    end)
  end
end
