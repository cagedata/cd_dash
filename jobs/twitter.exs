use Kitto.Job.DSL

:ok = ExTwitter.configure(
  consumer_key: CDDash.get_env(:cd_dash, :twitter_consumer_key),
  consumer_secret: CDDash.get_env(:cd_dash, :twitter_consumer_secret),
  access_token: CDDash.get_env(:cd_dash, :twitter_access_token),
  access_token_secret: CDDash.get_env(:cd_dash, :twitter_access_token_secret)
)

job :twitter do
  search = CDDash.get_env(:cd_dash, :twitter_search)

  ExTwitter.stream_filter(track: search)
  |> Stream.map(fn(x) -> broadcast!(:tweet, Twitter.tweet_to_widget(x)) end)
  |> Enum.to_list
end

defmodule Twitter do
  def tweet_to_widget(tweet) do
    %{
      text: tweet.text,
      name: tweet.user.name,
      screenName: tweet.user.screen_name,
      profilePic: tweet.user.profile_image_url
    }
  end
end
