defmodule Echo.Adapters.Logger do
  use Echo.Adapters.Behavior
  require Logger

  def notify(event_type, data) do
    Logger.info "Type: #{inspect event_type}; Data: #{inspect data}"
    {:ok, __MODULE__}
  end
end
