defmodule Echo do
  @moduledoc """
  Dispatches notifications using configurable adapters
  """

  @default_config %{
    preferences: Echo.Preferences.AllowAll,
    adapters: [Echo.Adapters.Logger]
  }

  @doc """
  Merges the application config with the default configuration options specified by Echo.
  """
  @spec config() :: List.t
  def config do
    default_config Application.get_env(:echo, Echo)
  end

  @doc """
  Notify calls dispatch/2 on each adapter, which checks preferences then sends notification.
  A List of tuples is returned of the form {:ok, __MODULE__} or {:error, __MODULE__, term | String.t}
  indicating the status of each call.
  """
  @spec notify(term | String.t, Map.t) :: List.t | nil
  def notify(event_type, data) do
    if Echo.config[:preferences].notification_allowed?(event_type, data) do
      Enum.map Echo.config[:adapters], fn(adapter) -> adapter.dispatch(event_type, data) end
    end
  end


  @spec default_config(Map.t) :: Map.t
  defp default_config(configuration) do
    case Enum.empty?(configuration) do
      true -> @default_config
      false -> Map.merge @default_config, Enum.into(configuration, %{})
    end
  end
end