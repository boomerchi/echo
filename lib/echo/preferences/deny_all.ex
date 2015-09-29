defmodule Echo.Preferences.DenyAll do
  @moduledoc """
  Base implementation denying all notifications.
  """

  @behaviour Echo.Preferences.Behaviour
  def notification_allowed?(_event_type, _data), do: false
  def notification_allowed?(_adapter, _event_type, _data), do: false

  @doc false
  defmacro __using__(_opts) do
    quote do
      def notification_allowed?(_event_type, _data), do: false
      def notification_allowed?(_adapter, _event_type, _data), do: false
    end
  end
end
