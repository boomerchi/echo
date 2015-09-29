defmodule Echo.Adapters.Email do
  @moduledoc """
  An Email adapter powered by [Mailman](https://github.com/kamilc/mailman)

  When using this adapter, add the appropriate dependency to your mix file.
  See Adapter Project page for up-to-date details.

  ex.)
    {:echo, "~> x.x.x"}
    {:mailman, "~> x.x.x"},
    {:eiconv, github: "zotonic/eiconv"}
  """
  use Echo.Adapters.Behaviour


  def notify(event_type, data) do
    config = Echo.config.hooks[:email].config(event_type, data)
    message = Echo.config.hooks[:email].message(event_type, data)
    if message do
      {:ok, __MODULE__, Mailman.deliver(message, config)}
    else
      {:error, __MODULE__, :unknown_event}
    end
  end
end
