defmodule Tutorial.Recursion.Factorial do
  def of(0) do
    0
  end

  def of(1) do
    1
  end

  def of(nums) do
    nums * of(nums - 1)
  end
end
