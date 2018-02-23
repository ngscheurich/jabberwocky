alias Jabberwocky.Users.User
alias Jabberwocky.ServiceRequests.ServiceRequest
alias Jabberwocky.Repo

[
  User.changeset(%User{}, %{twilio_id: Ecto.UUID.generate(), phone_number: "+12251234567"}),
  User.changeset(%User{}, %{twilio_id: Ecto.UUID.generate(), phone_number: "+12252345678"}),
  User.changeset(%User{}, %{twilio_id: Ecto.UUID.generate(), phone_number: "+12253456789"})
]
|> Enum.each(fn x -> Jabberwocky.Repo.insert(x) end)

users = Repo.all(User)

for _ <- 1..20 do
  ServiceRequest.changeset(%ServiceRequest{}, %{
    address: "#{Faker.Address.street_address()}, Baton Rouge, LA, #{Faker.Address.zip()}",
    type: Enum.random(["open", "in_progress", "closed"]),
    notfiy: Enum.random([true, false]),
    image_url: Enum.random([Faker.Internet.url(), nil]),
    service_request_id: Enum.random([Ecto.UUID.generate(), nil]),
    user_id: Enum.random(users).id
  })
  |> Jabberwocky.Repo.insert()
end
