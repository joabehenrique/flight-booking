defmodule Flightex.Users.Agent do
  @moduledoc """
    Agent para gerenciamento dos usuarios que são criados..
  """
  use Agent

  alias Flightex.Users.User

  def start, do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def increment_user(%User{} = user),
    do: Agent.update(__MODULE__, fn agent_state -> increment(agent_state, user) end)

  def get_user(cpf),
    do: Agent.get(__MODULE__, fn agent_state -> get_user_cpf(agent_state, cpf) end)

  defp increment(agent, %User{cpf: cpf} = user), do: Map.put(agent, cpf, user)

  defp get_user_cpf(agent_state, cpf) do
    case Map.get(agent_state, cpf) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
