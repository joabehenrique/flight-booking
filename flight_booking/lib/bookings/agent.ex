defmodule Flightex.Bookings.Agent do
  @moduledoc """

  """
  use Agent

  alias Flightex.Bookings.Booking

  def start_link(%{}), do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def save(%Booking{user_id: id} = booking) do
    Agent.update(__MODULE__, fn agent_state -> Map.put(agent_state, id, booking) end)

    {:ok, id}
  end

  def get(uuid),
    do: Agent.get(__MODULE__, fn agent_state -> get_booking_uuid(agent_state, uuid) end)

  def get_all, do: Agent.get(__MODULE__, fn agent_state -> agent_state end)

  def get_booking_uuid(agent_state, uuid) do
    case Map.get(agent_state, uuid) do
      nil -> {:error, "Booking not found"}
      booking -> {:ok, booking}
    end
  end
end
