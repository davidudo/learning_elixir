defmodule Tutorial.List.LinkedList do
  @moduledoc """
    Sums all elements in a list
  """

  @doc """
    Base case function
  """
  @spec sum_list(list(number())) :: number()
  def sum_list([]) do
    0
  end

  @spec sum_list(list(number())) :: number()
  def sum_list([head | tail]) do
    head + sum_list(tail)
  end

  def sum_list_tail(nums, acc \\ 0)

  def sum_list_tail([], acc) do
    acc + 0
  end

  def sum_list_tail([head | tail], acc) do
    sum_list_tail(tail, acc + head)
  end
end
