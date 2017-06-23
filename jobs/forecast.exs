# Broadcasts the forecast every 10 minutes for the Forecast widget.
#
# Setup:
#
# Update the location variable in the job with the GPS coordinates to get the
# forecast for.

use Kitto.Job.DSL

location = Application.get_env(:cd_dash, :forecast_location, "41.454810, -72.818426")

job :forecast, every: {10, :minutes} do
  forecast = ForecastIO.get(location)
  |> ForecastIO.to_dashboard

  broadcast! :forecast, forecast
end
