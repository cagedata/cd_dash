use Kitto.Job.DSL

job :level_1, every: {5, :minutes} do

  issues = Jira.issues({:jql, "status=\"Level 1 Support\" AND resolution=Unresolved"})
  broadcast! "level_1_list", %{items: issues["issues"] |> Enum.map(&Jira.issue_for_dashboard/1)}
  broadcast! "level_1_count", %{value: Jira.count(issues)}
end

job :level_2, every: {5, :minutes} do
  issues = Jira.issues({:jql, "status=\"Level 2 Support\" AND resolution=Unresolved"})
  broadcast! "level_2_list", %{items: issues["issues"] |> Enum.map(&Jira.issue_for_dashboard/1)}
  broadcast! "level_2_count", %{value: Jira.count(issues)}
end

job :level_3, every: {5, :minutes} do
  issues = Jira.issues({:jql, "status=\"Level 3 Support\" AND resolution=Unresolved"})
  broadcast! "level_3_list", %{items: issues["issues"] |> Enum.map(&Jira.issue_for_dashboard/1)}
  broadcast! "level_3_count", %{value: Jira.count(issues)}
end

job :waiting_for_others, every: {5, :minutes} do
  issues = Jira.issues({:jql, "status in (\"Waiting for customer\", \"Waiting for  customer\", \"Waiting for vendor\", \"Waiting for  vendor\", \"Waiting for   vendor\", \"Waiting for   customer\") AND resolution=Unresolved"})

  broadcast! "waiting_for_others_list", %{items: issues["issues"] |> Enum.map(&Jira.issue_for_dashboard/1)}
  broadcast! "waiting_for_others_count", %{value: Jira.count(issues)}
end

# job :open_tickets, every: {5, :minutes} do
#   issues = Jira.issues({:jql, "resolution=Unresolved"})
#   broadcast! "open_tickets_count", %{value: Jira.count(issues)}
# end

# filters = [{:level_1, {:jql, "status=\"Level 1 Support\" AND resolution=Unresolved"}},
#  {:level_2, {:jql, "status=\"Level 2 Support\" AND resolution=Unresolved"}},
#  {:level_3, {:jql, "status=\"Level 3 Support\" AND resolution=Unresolved"}},
#  {:waiting_on_others, {:filter, "13400"}}]
#
# Enum.each(filters, fn({job_name, filter}) ->
#   job job_name, every: {5, :minutes} do
#     issues = Jira.issues(filter)
#
#     broadcast! to_string(job_name) <> "_list", %{items: issues["issues"] |> Enum.map(&Jira.issue_for_dashboard/1)}
#     broadcast! to_string(job_name) <> "_count", %{value: Jira.count(issues)}
#   end
# end)
