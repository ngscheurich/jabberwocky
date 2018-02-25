defmodule JabberwockyWeb.ServiceRequestController do
  use JabberwockyWeb, :controller

  alias Jabberwocky.ServiceRequests
  alias Jabberwocky.ThreeOneOne.ServiceRequest
  alias Jabberwocky.Users
  alias Jabberwocky.Users.User
  alias Jabberwocky.Mailer
  alias Jabberwocky.Email

  action_fallback TestJabberwockyWeb.FallbackController

  def create(conn, %{
    "phone_number" => phone_number,
    "address" => address,
    "type" => type,
    "image_url" => image_url,
    "notify" => notify
  }) do
    user = maybe_create_user(phone_number)
    attrs = %{
      address: address,
      type: translate_type(type),
      notify: translate_notify(notify),
      image_url: image_url,
      user_id: user.id
    }

    with {:ok, %ServiceRequest{} = service_request} <- ServiceRequests.create(attrs) do
      send_service_request_email(service_request) 

      conn
      |> put_status(:created)
      |> put_resp_header("location", service_request_path(conn, :show, service_request))
      |> render("show.json", service_request: service_request)
    end
  end

  @doc false
  @spec maybe_create_user(String.t) :: %User{}
  defp maybe_create_user(phone_number) do
    case Users.get_by!(%{phone_number: phone_number}) do
      %User{} = user ->
        user
      nil ->
        {:ok, user} = Users.create(%{phone_number: phone_number})
        user
    end
  end

  @doc false
  @spec translate_notify(String.t) :: boolean
  defp translate_type(input) do
    types = %{
      "1" => :tall_grass,
      "2" => :junk_property,
      "3" => :condemn_property,
      "4" => :abandoned_vehicle,
      "5" => :swimming_pool,
      "6" => :missing_portal,
      "7" => :illegal_sign,
      "one" => :tall_grass,
      "two" => :junk_property,
      "three" => :condemn_property,
      "four" => :abandoned_vehicle,
      "five" => :swimming_pool,
      "six" => :missing_portal,
      "seven" => :illegal_sign
    }

    types[input]
  end

  @doc false
  @spec translate_notify(String.t) :: boolean
  defp translate_notify(input) do
    input = String.downcase(input)
    yes = ["yes", "y", "yeah", "yup", "sure", "ok", "okay", "fine",
           "affirmative", "yea", "yessir", "of course", "yep", "sounds good",
           "okily dokily"]

    if Enum.member?(yes, input), do: true, else: false
  end

  @doc false
  @spec send_service_request_email(%ServiceRequest{}) :: no_return()
  defp send_service_request_email(service_request) do
    service_request
    |> Email.service_request_email()
    |> Mailer.deliver_later()
  end
end
