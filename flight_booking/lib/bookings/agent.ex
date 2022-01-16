defmodule Flightex.Bookings.Agent do
  @moduledoc """

  """
  alias Flightex.Bookings.Booking

  def start, do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def create_booking(%Booking{id: id} = booking) do
    Agent.update(__MODULE__, fn agent_state -> Map.put(agent_state, id, booking) end)

    {:ok, id}
  end

  def get_booking(uuid),
    do: Agent.get(__MODULE__, fn agent_state -> get_booking_uuid(agent_state, uuid) end)

  def get_booking_uuid(agent_state, uuid) do
    case Map.get(agent_state, uuid) do
      nil -> {:error, "Booking not found"}
      booking -> {:ok, booking}
    end
  end
end
