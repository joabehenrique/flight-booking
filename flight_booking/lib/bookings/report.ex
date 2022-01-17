defmodule Flightex.Bookings.Report do
  @moduledoc """
    permite gerar relatórios referente as reservas criadas
  """

  alias Flightex.Bookings.Agent
  alias Flightex.Bookings.Booking

  def create(from_date, to_date, filename \\ "report.csv") do
    report = build_report(from_date, to_date)

    case report do
      [] ->
        {:null, "No record for the condition used"}

      _other_cases ->
        File.write("./lib/generated_reports/#{filename}", report)
        {:ok, "Report generated successfully"}
    end
  end

  defp build_report(from_date, to_date) do
    Agent.get_all()
    |> Map.values()
    |> Enum.filter(fn booking -> filter_date(booking, from_date, to_date) end)
    |> Enum.map(fn booking -> build_list_booking(booking) end)
  end

  defp filter_date(%Booking{complete_date: complete_date} = booking, from_date, to_date) do
    if NaiveDateTime.compare(complete_date, from_date) != :lt and
         NaiveDateTime.compare(complete_date, to_date) != :gt,
       do: booking
  end

  defp build_list_booking(%Booking{
         complete_date: complete_date,
         local_origin: local_origin,
         local_destination: local_destination,
         user_id: id
       }) do
    "#{id}, #{local_origin}, #{local_destination}, #{complete_date}\n"
  end
end
