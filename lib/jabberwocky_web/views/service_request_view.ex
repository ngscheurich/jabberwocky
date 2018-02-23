defmodule JabberwockyWeb.ServiceRequestView do
  use JabberwockyWeb, :view
  alias JabberwockyWeb.ServiceRequestView

  def render("show.json", %{service_request: service_request}) do
    %{data: render_one(service_request, ServiceRequestView, "service_request.json")}
  end

  def render("service_request.json", %{service_request: service_request}) do
    %{
      id: service_request.id,
      address: service_request.address,
      type: service_request.type,
      notify: service_request.notify,
      image_url: service_request.image_url,
      service_request_id: service_request.service_request_id,
      status: service_request.status
    }
  end
end
