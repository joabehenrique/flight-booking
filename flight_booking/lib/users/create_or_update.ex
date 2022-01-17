defmodule Flightex.Users.CreateOrUpdate do
  @moduledoc """
    Chamadas para criação de Usuários
  """

  alias Flightex.Users.User
  alias Flightex.Users.Agent

  def call(%{name: _name, email: _email, cpf: cpf}) when is_integer(cpf),
    do: {:error, "Cpf must be a String"}

  def call(%{name: name, email: email, cpf: cpf}) do
    name
    |> User.build(email, cpf)
    |> call_agent()
  end

  defp call_agent({:ok, user}) do
    Agent.save(user)

    {:ok, "Sucessful User Creation or Update"}
  end

  defp call_agent({:error, _user}), do: {:error, "Invalid parameters"}
end
