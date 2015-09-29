defmodule Echo.Adapters.Email do
  use Echo.Adapters.Behavior

  def notify(event_type, data) do
    template = case event_type do
      :register -> "emails/register"
      :forgot_password -> "emails/password"
      _ -> nil
    end

    if is_nil(template) do
      {:error, __MODULE__, :unknown_event}
    else
      Mailman.compose(to: data.user.email, from: "test@example.com", subject: template.subject, body: template.body)
      {:ok, __MODULE__}
    end
  end
end
