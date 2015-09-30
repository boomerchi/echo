defmodule Echo.Hooks do
  @moduledoc """
  message/2 must be implemented, returning the data for an adapter to deliver a notification.
  """
  use Behaviour

  defcallback message(term | String.t | nil, any) :: any
end
