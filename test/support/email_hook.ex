defmodule Echo.Test.EmailHook do
  @behaviour Echo.Hooks

  # TODO - Remove pending deletion in Mailman
  def config(_event_type, _data) do
    %Mailman.Context{
      config:   %Mailman.TestConfig{},
      composer: %Mailman.EexComposeConfig{
        html_file: true,
        text_file: true
      }
    }
  end

  def message(event_type, data) do
    template = "emails/#{event_type}"
    subject = case event_type do
      :register -> "Welcome to Echo!"
      _ -> nil
    end

    if subject do
      %Mailman.Email{
        subject: subject,
        from: "accounts@example.com",
        reply_to: '',
        to: [ data.user.email ],
        cc: [],
        bcc: [],
        attachments: [],
        data: %{
          name: data.user.email
        },
        text: template <> ".txt.eex",
        html: template <> ".html.eex"
      }
    end
  end
end
