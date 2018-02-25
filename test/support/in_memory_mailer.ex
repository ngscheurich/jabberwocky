defmodule Jabberwocky.Email.InMemoryMailer do
  @behaviour Jabberwocky.Email.Client

  def deliver_later(email), do: email
end
