defmodule CDDash do
  def get_env(app, key, default \\ nil) do
    case Application.get_env(app, key, default) do
      {:system, value} -> System.get_env(value)
      value -> value
    end
  end
end
