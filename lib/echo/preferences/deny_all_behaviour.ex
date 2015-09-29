defmodule Echo.Preferences.DenyAllBehaviour do
  @moduledoc """
  Base implementation denying all notifications.
  """

  @doc false
  defmacro __using__(_opts) do
    quote do
      @behaviour Echo.Preferences.Behaviour
      def notification_allowed?(_event_type, _data), do: false
      def notification_allowed?(_adapter, _event_type, _data), do: false
    end
  end
end
