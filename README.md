![](https://img.shields.io/badge/RoR-red)
![](https://img.shields.io/badge/SASS-blue)
![](https://img.shields.io/badge/Tailwind-CSS-yellow)
![](https://img.shields.io/badge/Responsive-Design-green)

# <img src="app/assets/images/logo.png"> McNamara

> McNamara is an expense tracker web application built with Rails, PostgreSQL and Docker that tracks expenses and expense categories.

<br>
<p align="center">
  <img src="docs/mobile.png" width="400">
</p>
<br>

## Features

- Creation of custom categories
- Global time zone selection
- Custom icon upload for categories powered by `Active Storage`
- FOREX currency stats for `USD`, `CAD`, `CHF`, `DKK`, `JPY` and `GBP`
- Downloadable expenses pie chart

## Built With

- Ruby v2.7.0
- Ruby on Rails v6.1.2
- PostgreSQL:latest
- Tailwind CSS
- [Rates API](https://ratesapi.io/)

## Live Demo

https://bit.ly/3bWNsof

## Getting Started

To get a local copy up and running follow the next steps:

- Get the repository by either cloning or Zip download
- Install gems with `bundle install`
- Setup database with `bin/rails db:migrate`. Keep in mind that you need to setup Postgres by installing it or by running it inside a Docker instance.
- Make sure all node packages are available by running `npm install`

### Usage

Start server with:

```
bin/rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
rspec
```

### Deployment

The live version was deployed to a server running Ubuntu 20.04 with the following architecture where the PostgreSQL DB and the Rails Application run inside a Docker container.

<img src="./docs/architecture.png">

<br/><br/>
The PostgreSQL DB has the following schema:

<img src="./docs/erd.png">


## Author

👤 **Josias Alvarado**

- GitHub: [@pointerish](https://github.com/pointerish)
- Twitter: [@pointerish](https://twitter.com/pointerish)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/josias-alvarado/)

## Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/pointerish/ror-social-scaffold/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [The Odin Project](https://www.theodinproject.com/)
- [Microverse](https://microverse.org)
- [My brain](https://josias-alvarado.me)
- [Rates API](https://ratesapi.io/)

## License

This project is [MIT](LICENSE) licensed.
