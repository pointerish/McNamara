![](https://img.shields.io/badge/RoR-red)
![](https://img.shields.io/badge/SASS-blue)

# McNamara

> McNamara is an expense tracker web application built with Rails, PostgreSQL and Docker

<p style="center"><img src="app/assets/images/updated-logo.png"></p>

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4
- PostgreSQL 9.5

## Live Demo

http://192.53.163.209/users/sign_in

## Getting Started

To get a local copy up and running follow these simple example steps.


### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
rails db:create
rails db:migrate
```

### Usage

Start server with:

```
rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
rspec --format documentation
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

## License

This project is [MIT](LICENSE) licensed.
