defmodule Tutorial.Recursion.AddDigits do
  def upto(0) do
    0
  end

  def upto(nums) do
    nums + upto(nums - 1)
  end

  def upto_tail_recur(0, acc), do: acc

  def upto_tail_recur(nums, acc \\ 0) do
    upto_tail_recur(nums - 1, acc + nums)
  end
end
