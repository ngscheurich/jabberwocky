defmodule Jabberwocky.Email.Client do
  @callback deliver_later(%Bamboo.Email{}) :: %Bamboo.Email{}
end
