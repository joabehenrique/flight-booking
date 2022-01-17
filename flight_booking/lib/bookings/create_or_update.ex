defmodule Flightex.Bookings.CreateOrUpdate do
  @moduledoc """
    Chamadas para criação de Usuários
  """

  alias Flightex.Bookings.Booking
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Users.Agent, as: UserAgent

  def call(%{
        complete_date: complete_date,
        local_origin: local_origin,
        local_destination: local_destination,
        user_id: id
      }) do
    with {:ok, booking} <- Booking.build(complete_date, local_origin, local_destination, id) do
      BookingAgent.save(booking)
    else
      error -> error
    end
  end
end
