defmodule Echo.Preferences.Test do
  @moduledoc """
  An example of how to define policies around notification preferences
  """

  # Example of permit/deny notifications for all adapters
  #########################

  # Deny any notifications if the data.user is admin
  def notification_allowed?(_event_type, data) do
    if data && data.user.type == 'admin' do
      false
    else
      true
    end
  end


  # Example of permit/deny notifications for a specific adapter
  #########################

  # Deny emails if user is blocked
  def notification_allowed?(Echo.Adapters.Email, _event_type, data) do
    if data && data.user.status == 'blocked' do
      false
    else
      true
    end
  end


  # Use pattern matching to catch all remaining options
  #########################

  # When using the preferences as a blacklist: default to allowing
  use Echo.Preferences.AllowAll

  # Alternatively, design this file as a whitelist: default to blocking
  # use Echo.Preferences.DenyAll
end
