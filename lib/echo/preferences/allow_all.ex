defmodule Echo.Preferences.AllowAll do
  @moduledoc """
  Base implementation allowing all notifications.
  """

  @behaviour Echo.Preferences.Behaviour
  def notification_allowed?(_event_type, _data), do: true
  def notification_allowed?(_adapter, _event_type, _data), do: true

  @doc false
  defmacro __using__(_opts) do
    quote do
      def notification_allowed?(_event_type, _data), do: true
      def notification_allowed?(_adapter, _event_type, _data), do: true
    end
  end
end
