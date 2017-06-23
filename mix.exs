defmodule CdDash.Mixfile do
  use Mix.Project

  def project do
    [app: :cd_dash,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [applications: [:logger, :kitto, :httpoison, :extwitter]]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:kitto, github: "kittoframework/kitto", branch: "master"},
      {:distillery, "1.3.1"},
      {:poison, "~> 3.1.0", override: true},
      {:httpoison, "~> 0.11.1"},
      {:extwitter, "~> 0.8.4"}
   ]
  end
end
