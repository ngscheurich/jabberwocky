defmodule Jabberwocky.Email do
  import Bamboo.Email

  alias Jabberwocky.BR311.ServiceRequest

  @spec service_request_email(%ServiceRequest{}) :: no_return()
  def service_request_email(service_request) do
    new_email(
      to: "ngscheurich+jabberwocky@gmail.com",
      from: "notifications@jabberwockyapp.com",
      subject: "Blight reported at #{service_request.address}",
      html_body: "Blight reported at #{service_request.address}",
      text_body: "Blight reported at #{service_request.address}"
    )
  end
end
