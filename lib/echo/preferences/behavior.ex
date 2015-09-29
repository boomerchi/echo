defmodule Echo.Preferences.Behavior do
  @moduledoc """
  notification_allowed?/2 & notification_allowed?/3 must be provided
  """
  use Behaviour

  defcallback notification_allowed?(term | String.t | nil, Map.t | nil) :: boolean
  defcallback notification_allowed?(term | String.t | nil, term | String.t | nil, Map.t | nil) :: boolean
end