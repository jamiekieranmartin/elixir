defmodule Square do
  defstruct w: 0, h: 0

  def area(%Square{w: w, h: h}) do
    w * h
  end
end
