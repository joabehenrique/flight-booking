defmodule Flightex.Users.CreateOrUpdate do
  @moduledoc """
    Chamadas para criação de Usuários
  """

  alias Flightex.Users.User
  alias Flightex.Users.Agent

  def create_user(%{name: name, email: email, cpf: cpf}) do
    name
    |> User.build(email, cpf)
    |> call_agent()
  end

  defp call_agent({:ok, user}) do
    Agent.increment_user(user)

    {:ok, "Sucessful User Creation or Update"}
  end

  defp call_agent({:error, _user}), do: {:error, "Invalid parameters"}
end
