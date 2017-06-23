use Kitto.Job.DSL

job :incidents, every: {5, :minutes} do
  incidents = VictorOps.incidents()
  |> Enum.map(fn(incident) ->
    value = if String.length(incident["entityDisplayName"]) > 0 do
      incident["entityDisplayName"]
    else
      incident["entityId"]
    end
    %{label: incident["currentPhase"], value: "[#{incident["incidentNumber"]}] #{value}"}
  end)


  broadcast! %{items: incidents}
end
