defmodule Flightex.Users.User do
  @moduledoc """
    Modulo para a criacao do usuario e seu gerenciamento
  """

  @keys [:id, :name, :email, :cpf]

  @enforce_keys @keys

  defstruct @keys

  def build(_name, _email, cpf) when is_integer(cpf), do: {:error, "Cpf must be a String"}

  def build(name, email, cpf) do
    {:ok,
     %__MODULE__{
       id: UUID.uuid4(),
       name: name,
       email: email,
       cpf: cpf
     }}
  end

  def build(_name, _email, _cpf), do: {:error, "Invalid parameters"}
end
