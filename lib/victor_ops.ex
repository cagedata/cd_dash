defmodule VictorOps do
  def on_call(team) do
    team = URI.parse("#{url_root()}/team/#{team}/oncall/schedule")
    |> get()

    on_call = team["schedule"] |> List.first |> Map.get("onCall")
    if !Enum.empty?(team["overrides"]) do
      Enum.reduce(team["overrides"], on_call, fn(override, acc) ->
        if override["origOnCall"] == acc, do: override["origOnCall"], else: acc
      end)
    else
      on_call
    end
  end

  def user(user) do
    URI.parse("#{url_root()}/user/#{user}")
    |> get()
  end

  def incidents do
    URI.parse("#{url_root()}/incidents")
    |> get()
    |> Map.get("incidents")
    |> Enum.filter(fn(i) -> Enum.member?(["UNACKED", "ACKED"], i["currentPhase"]) end)
  end

  defp get(uri) do
    uri
    |> HTTPoison.get!(authentication())
    |> Map.get(:body)
    |> Poison.decode!
  end

  defp authentication do
    ["x-vo-api-id": api_id(), "x-vo-api-key": api_key()]
  end

  defp url_root, do: "https://api.victorops.com/api-public/v1"

  defp api_id, do: CDDash.get_env(:cd_dash, :victorops_api_id)
  defp api_key, do: CDDash.get_env(:cd_dash, :victorops_api_key)
end
