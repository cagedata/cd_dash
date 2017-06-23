# lib/apis/jira.ex
defmodule Jira do
  def issues({:jql, jql}) do
    search("jql=#{URI.encode(jql)}")
  end

  def count(issues) do
    issues["total"]
  end

  def issue_for_dashboard(issue) do
    %{
      id: issue["key"],
      summary: issue["fields"]["summary"],
      priority: issue["fields"]["priority"]
    }
  end

  defp search(query) do
    URI.parse("#{url_root()}/rest/api/2/search?#{query}&maxResults=100")
    |> HTTPoison.get!(authentication())
    |> Map.get(:body)
    |> Poison.decode!
  end

  defp username, do: CDDash.get_env(:cd_dash, :jira_username)
  defp password, do: CDDash.get_env(:cd_dash, :jira_password)
  defp url_root, do: CDDash.get_env(:cd_dash, :jira_url)

  defp authentication do
    ["Authorization": "Basic " <> Base.encode64("#{username()}:#{password()}")]
  end
end
