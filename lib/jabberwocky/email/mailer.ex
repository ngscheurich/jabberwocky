defmodule Jabberwocky.Email.Mailer do
  @behaviour Jabberwocky.Email.Client

  use Bamboo.Mailer, otp_app: :jabberwocky
end
