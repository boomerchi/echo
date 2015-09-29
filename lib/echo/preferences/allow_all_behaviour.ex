defmodule Echo.Preferences.AllowAllBehaviour do
  @moduledoc """
  Base implementation allowing all notifications.
  """

  @doc false
  defmacro __using__(_opts) do
    quote do
      @behaviour Echo.Preferences.Behaviour
      def notification_allowed?(_event_type, _data), do: true
      def notification_allowed?(_adapter, _event_type, _data), do: true
    end
  end
end
