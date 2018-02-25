<p align="center">
  <img src="https://raw.githubusercontent.com/ngscheurich/jabberwocky/master/nameplate.jpg" alt="Jabberwocky fights the blight">
  <a href="https://travis-ci.org/ngscheurich/jabberwocky">
    <img src="https://img.shields.io/travis/ngscheurich/jabberwocky/master.svg?style=flat-square" alt="Build status">
  </a>
  <a href="https://coveralls.io/github/ngscheurich/jabberwocky">
    <img src="https://img.shields.io/coveralls/github/ngscheurich/jabberwocky.svg?style=flat-square" alt="Coverage status">
  </a>
</p>
<p align="center">
  An enigmatic creature that devours blight
</p>

---

## Description

Jabberwocky is an SMS-based app that empowers Baton Rouge citizens to report instances of blight and tries
to ensure that there reports are handled in a timely fashion.

## Roadmap

- [x] Refine contexts
- [ ] Translate `:service_request` enums to 311 blight descriptions in emails
- [ ] Add [Dialyxir](https://github.com/jeremyjh/dialyxir) and typespecs
- [x] Improve code coverage
- [ ] Implement CI to test builds
- [ ] Basic GraphQL web API
- [ ] (Re)design [website](https://github.com/ngscheurich/jabberwocky-site)
  - [ ] Branding
  - [ ] Blight map
  - [ ] Blight stats
  - [ ] Service request status check
- [ ] Create escalation emails based on service request age
- [ ] Include images (or image URLs) in service request email
- [ ] Move this all to a Trello board

## Contributing

Rome wasn’t built in a day, but Jabberwocky was. This project came into being on Friday, February 23, 2018
and was built for the [Activate](http://www.activateconf.com/) 2018 hackathon. We’re working hard to
improve upon our initial vision, but we’d love your help! PRs are welcome—just be sure you adhere to the
[code of conduct](https://github.com/ngscheurich/jabberwocky/blob/master/CODE_OF_CONDUCT.md).

### Development

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

#### Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
