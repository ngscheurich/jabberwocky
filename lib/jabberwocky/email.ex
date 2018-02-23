defmodule Jabberwocky.Email do
  import Bamboo.Email

  alias Jabberwocky.ServiceRequests.ServiceRequest

  @spec service_request_email(%ServiceRequest{}) :: no_return()
  def service_request_email(service_request) do
    new_email(
      to: "nick@scheurich.me",
      from: "mail@jabberwockyapp.com",
      subject: "Blight reported at #{service_request.address}",
      html_body: """
      <p>A citizen has reported the following:</p>
      <ul>
        <li><b>Address:</b> #{service_request.address}</li>
        <li><b>Blight type: #{service_request.type}</li>
        <li><b>Image: #{service_request.image_url}</li>
      </ul>
      """,
      text_body: """
      Blight reported at #{service_request.address} (#{service_request.type})
      """
    )
  end
end