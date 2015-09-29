use Mix.Config

config :echo, Echo,
  preferences: Echo.Preferences.Test,
  adapters: [Echo.Adapters.Logger, Echo.Adapters.Email],
  hooks: %{
    email: Echo.Test.EmailHook
  }
