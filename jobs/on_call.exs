use Kitto.Job.DSL

job :on_call, every: {5, :minutes} do
  on_call = Application.get_env(:cd_dash, :victorops_team, "support-team")
  |> VictorOps.on_call
  |> VictorOps.user

  broadcast! %{text: "#{on_call["firstName"]} #{on_call["lastName"]}"}
end
