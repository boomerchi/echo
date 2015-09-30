[Echo - ECHO Echo echo...](https://en.wikipedia.org/wiki/Echo_(mythology))
======

A simple & highly extendable, meta-notification system; Echo checks notification preferences & dispatch notifications to different adapters (ex. email, logger, analytics, sms, etc.).

[![Build Status](https://travis-ci.org/zmoshansky/echo.svg)](https://travis-ci.org/zmoshansky/echo) [![Hex.pm](http://img.shields.io/hexpm/v/echo.svg)](https://hex.pm/packages/echo) [![Hex.pm](http://img.shields.io/hexpm/dt/echo.svg)](https://hex.pm/packages/echo) [![Github Issues](http://githubbadges.herokuapp.com/zmoshansky/echo/issues.svg)](https://github.com/zmoshansky/echo/issues) [![Pending Pull-Requests](http://githubbadges.herokuapp.com/zmoshansky/echo/pulls.svg)](https://github.com/zmoshansky/echo/pulls)

#### Description ####
Echo is designed to be highly adaptable to your notification needs through different adapters and per adapter hooks. A notification is dispatched with `Echo.notify/2` which then calls on each registered adapter, requesting that it delivers the notification. Each adapter is passed an `event_type`, of your designation, and `data` that it may use to deliver the notification.

#### Config ####
Echo is easible configured, a possible sample configuration is given below. Custom Preferences & Adapters are easy to build, look at `lib/echo/adapters/email` & `test/support/test_preferences.ex` for examples. Hooks allow you to specify the module which implements `@behaviour Echo.Hooks`, which generates the adapter specific data needed to deliver a notification (see `test/support/email_hook` for an example); this might include: selecting the correct template, parsing data, or even nothing at all. Doing nothing allows unknown event types to be skipped by adapters.

```
config :echo, Echo,
  preferences: Echo.Preferences.AllowAll,
  adapters: [Echo.Adapters.Logger, Echo.Adapters.Email, YourApp.CustomAdapter],
  hooks: %{
    email: YourApp.EmailHook
  }
```

#### Architecture ####
Echo is somewhat like a pub-sub system; events are published, and adapters that are capable of handling them dispatch the notification accordingly. The intended flow is:

- `preferences` module provides an ACL to check whether an event should be delivered on a particular adapter according to a user's preferences (ex. deny newsletters, but allow billing emails).
- `hooks` provide a way to prepare arguments to an adapter based on the `event_type` & `data`. A hook can prevent it's adapter from delivering the notification if no data is returned. This means notifications are only sent for adapters that are configured to handle them, otherwise, they are harmlessly disregarded by that adapter.

ex.) In the code below, an email is sent for `:user_register`, but not `:log_analytics`; `Adapter.Email` will harmlessly skip it as an `:unknown_event`.
```
Echo.notify(:log_analytics, data)
...
Echo.notify(:user_register, data)
```
```
defmodule App.EmailHook
@behaviour Echo.Hooks

  def message(event_type, data) do
    ...
    template = case event_type do
      :user_register -> "emails/register.html.eex"
      :user_forgot_password -> "emails/forgot_password.html.eex"
      _ -> nil
    end
    ...
  end
end
```