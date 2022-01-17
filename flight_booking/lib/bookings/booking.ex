defmodule Flightex.Bookings.Booking do
  @moduledoc """
    Modulo para a criacao de reservas e seu gerenciamento
  """

  alias Flightex.Users.User

  @keys [:id, :complete_date, :local_origin, :local_destination, :user_id]

  @enforce_keys @keys

  defstruct @keys

  def build(%NaiveDateTime{} = complete_date, local_origin, local_destination, id) do
    {:ok,
     %__MODULE__{
       id: UUID.uuid4(),
       complete_date: complete_date,
       local_origin: local_origin,
       local_destination: local_destination,
       user_id: id
     }}
  end

  def build(_complete_date, _local_origin, _local_destination, _user_id),
    do: {:error, "Invalid parameters"}
end
