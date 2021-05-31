defmodule Sum do
  def sum([head | tail], n) do
    sum(tail, n + head)
  end

  def sum([], n) do
    n
  end
end
