defmodule Echo.Preferences.DenyAllTest do
  use ExUnit.Case

  test "notification_allowed?/2 always returns true" do
    refute Echo.Preferences.DenyAll.notification_allowed? :foo, %{}
    refute Echo.Preferences.DenyAll.notification_allowed? nil, nil
  end

  test "notification_allowed?/3 always returns true" do
    refute Echo.Preferences.DenyAll.notification_allowed? :foo, :bar, %{}
    refute Echo.Preferences.DenyAll.notification_allowed? :nil, nil, nil
  end
end
