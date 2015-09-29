defmodule Echo.Preferences.DenyAllBehavior do
  @moduledoc """
  Base implementation denying all notifications.
  """
  @behavior Echo.Preferences.Behavior

  @doc false
  defmacro __using__(_opts) do
    quote do
      def notification_allowed?(_event_type, _data), do: false
      def notification_allowed?(_adapter, _event_type, _data), do: false
    end
  end
end