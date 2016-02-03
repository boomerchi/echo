defmodule Echo.Preferences.Behaviour do
  @moduledoc """
  notification_allowed?/2 & notification_allowed?/3 must be provided
  """

  @callback notification_allowed?(term | String.t | nil, Map.t | nil) :: boolean
  @callback notification_allowed?(term | String.t | nil, term | String.t | nil, Map.t | nil) :: boolean
end