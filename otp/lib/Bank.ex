defmodule Bank do
  use GenServer

  # -- Client API --

  def start_link() do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def deposit(amount) do
    GenServer.cast(__MODULE__, {:deposit, amount})
  end

  def withdraw(amount) do
    GenServer.cast(__MODULE__, {:withdraw, amount})
  end

  def balance() do
    GenServer.call(__MODULE__, :balance)
  end

  # -- GenServer Callbacks --

  def init(balance) do
    {:ok, balance}
  end

  def handle_cast({:deposit, amount}, balance) do
    {:noreply, balance + amount}
  end

  def handle_cast({:withdraw, amount}, balance) do
    {:noreply, balance - amount}
  end

  def handle_call(:balance, _from, balance) do
    {:reply, balance, balance}
  end
end
