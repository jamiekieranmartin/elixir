defmodule Bank.Supervisor do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, name: __MODULE__)
  end

  def init(_init_arg) do
    children = [
      %{
        id: Bank,
        start: {Bank, :start_link, []}
      }
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
