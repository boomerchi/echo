defmodule Echo.Adapters.Logger do
  use Echo.Adapters.Behaviour
  require Logger

  def notify(event_type, data) do
    {:ok, __MODULE__, Logger.info "EventType: #{inspect event_type}; Data: #{inspect data}; #{__MODULE__}"}
  end
end
