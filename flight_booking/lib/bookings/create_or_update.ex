defmodule Flightex.Bookings.CreateOrUpdate do
  @moduledoc """
    Chamadas para criação de Usuários
  """

  alias Flightex.Bookings.Booking
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Users.Agent, as: UserAgent

  def create_booking(%{
        complete_date: complete_date,
        local_origin: local_origin,
        local_destination: local_destination,
        user_cpf: cpf
      }) do
    with {:ok, user} <- UserAgent.get_user(cpf),
         {:ok, booking} <- Booking.build(complete_date, local_origin, local_destination, user) do
      BookingAgent.create_booking(booking)
    else
      error -> error
    end
  end
end
