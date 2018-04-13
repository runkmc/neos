# NEOs iOS App

NEOs (Near Earth Objects) is an iOS app that tracks asteroids near earth using the [Near Earth Object Web Service](https://api.nasa.gov/api.html#NeoWS) maintained by [NASA](https://api.nasa.gov/index.html).

## Getting Started

Install bundler

```/sh
gem install bundler
```

Install the dependencies:

```/sh
bundle install
```

```/sh
bundle exec pod install
```

## Testflight Builds

Install the dependencies:

```/sh
bundle install
```

Make sure you have a `.env` file with the following keys defined:

- `APPLE_ID`
- `TEAM_ID`
- `ITUNES_CONNECT_TEAM_ID`
- `FASTLANE_APPLE_APP_SPECIFIC_PASSWORD`

Update the build number manually (for now).

Then run:

```/sh
fastlane beta
```

## License

This project is released open source under the MIT License. See [LICENSE](https://raw.githubusercontent.com/5calls/ios/master/LICENSE) for more details.

## Contributors

- [Scott Densmore](https://github.com/scottdensmore)

