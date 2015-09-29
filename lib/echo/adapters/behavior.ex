defmodule Echo.Adapters.Behavior do
  use Behaviour

  defcallback notify(term | String.t | nil, Map.t | nil) :: {:ok, term} | {:error, term, term | String.t}

  @doc false
  defmacro __using__(_opts) do
    quote do
      @spec dispatch(term | String.t | nil, Map.t | nil) :: Tuple.t
      def dispatch(event_type, data) do
        if Echo.config[:preferences].notification_allowed?(__MODULE__, event_type, data) do
          notify(event_type, data)
        else
          {:error, __MODULE__, :permission_denied}
        end
      end

      defoverridable [dispatch: 2]
    end
  end
end
