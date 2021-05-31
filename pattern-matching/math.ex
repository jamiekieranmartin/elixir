defmodule Math do
  def sum(i, n) do
    case i do
      [head | tail] -> sum(tail, n + head)
      [] -> n
    end
  end
end
