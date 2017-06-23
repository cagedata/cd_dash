defmodule ForecastIO do
  @moduledoc """
  API client for getting forecast from Forecast.io API.

  ## Setup

  Before you can interact with the API, you'll need a
  [DarkSky API key](https://darksky.net/dev/). Set the API key in the app
  environment and modify the api_key/0 method to pull from the correct
  environment.
  """

  @units "us"

  def get(location) do
    "https://api.forecast.io/forecast/#{api_key()}/#{URI.encode(location)}?units=#{@units}"
    |> URI.parse
    |> HTTPoison.get!
    |> Map.get(:body)
    |> Poison.decode!
  end

  def to_dashboard(forecast) do
    %{
      temperature: "#{forecast["currently"]["temperature"] |> Float.round |> trunc}º",
      summary: forecast["minutely"]["summary"]
    }
  end

  defp api_key, do: CDDash.get_env(:cd_dash, :forecastio_api_key)
end
