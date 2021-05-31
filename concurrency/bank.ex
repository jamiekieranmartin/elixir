defmodule Bank do
  def start do
    spawn(__MODULE__, :loop, [0])
  end

  def loop(state) do
    receive do
      {:stop, caller} ->
        send(caller, "Shutting down.")

      {:deposit, caller, amount} ->
        send(caller, "Deposited #{amount}")
        loop(state + amount)

      {:withdraw, caller, amount} ->
        send(caller, "Withdrew #{amount}")
        loop(state - amount)

      {:balance, caller} ->
        send(caller, "Balance is #{state}")
        loop(state)

      _ ->
        loop(state)
    end
  end
end
