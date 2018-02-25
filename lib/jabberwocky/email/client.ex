defmodule Jabberwocky.Email.Client do
  alias Jabberwocky.BR311.ServiceRequest

  @callback deliver_later(%ServiceRequest{}) :: %Bamboo.Email{}
end
