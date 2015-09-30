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
  @spec config() :: Map.t
  def config do
    Map.merge @default_config, Enum.into(Application.get_env(:echo, Echo), %{})
  end

  @doc """
  Notify calls dispatch/2 on each registered adapter, which checks preferences then sends notification.

  A List of tuples is returned of the form {:ok, __MODULE__} or {:error, __MODULE__, term | String.t}
  indicating the status of each call.
  """
  @spec notify(term | String.t, Map.t) :: List.t | nil
  def notify(event_type, data) do
    if Echo.config[:preferences].notification_allowed?(event_type, data) do
      Enum.map Echo.config[:adapters], fn(adapter) -> adapter.dispatch(event_type, data) end
    end
  end
end
