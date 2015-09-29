defmodule Echo.Preferences.AllowAllTest do
  use ExUnit.Case

  test "notification_allowed?/2 always returns true" do
    assert Echo.Preferences.AllowAll.notification_allowed? :foo, %{}
    assert Echo.Preferences.AllowAll.notification_allowed? nil, nil
  end

  test "notification_allowed?/3 always returns true" do
    assert Echo.Preferences.AllowAll.notification_allowed? :foo, :bar, %{}
    assert Echo.Preferences.AllowAll.notification_allowed? :nil, nil, nil
  end
end
