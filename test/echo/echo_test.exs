defmodule EchoTest do
  use ExUnit.Case, async: true

  test "config values for Echo Testing" do
    config = Echo.config
    assert config.preferences == Echo.Preferences.Test
    assert config.adapters == [Echo.Adapters.Logger, Echo.Adapters.Email]
  end

  # See test/support/test_preferences.ex for the policies that dictate these tests
  # Example of global policy
  test "notify returns nil if no adapters are dispatched" do
    assert Echo.notify(:comment, %{user: %{type: 'admin', status: 'nil'}}) == nil
  end

  # Example of adapter specific policy
  test "notify returns a status list for each adapter" do
    assert Echo.notify(:register, %{user: %{type: 'user', status: 'blocked'}}) == [{:ok, Echo.Adapters.Logger}, {:error, Echo.Adapters.Email, :permission_denied}]
  end

  # Example of adapter opting not to implement an event_type
  test "notify returns a status list for each adapter2" do
    assert Echo.notify(:comment, %{user: %{type: 'user', status: 'unblocked'}}) == [{:ok, Echo.Adapters.Logger}, {:error, Echo.Adapters.Email, :unknown_event}]
  end
end
