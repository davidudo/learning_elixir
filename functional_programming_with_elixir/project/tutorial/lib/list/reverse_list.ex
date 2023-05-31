defmodule Tutorial.List.ReverseList do
  def reverse(elements, acc \\ [])

  def reverse([], acc), do: acc

  def reverse([head | tail], acc) do
    reverse(tail, [head | acc])
  end
end
