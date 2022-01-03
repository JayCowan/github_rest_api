# API

A simple Dart HTTP server using [package:shelf](https://pub.dev/packages/shelf).

- Listens on "any IP" (0.0.0.0) instead of loop-back (localhost, 127.0.0.1) to allow remote connections.
- Defaults to listening on port `8080`, but this can be configured by setting the `PORT` environment variable. (This is
  also the convention used by
  [Cloud Run](https://cloud.google.com/run).)
- Includes `Dockerfile` for easy containerization

To set up environment variables see [package:dotenv](https://pub.dev/packages/dotenv). By default uses `./.env` as the
environment file.

For any file accessing `./.env` check that `package:dotenv` is imported like so

```dart
import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;

// Once imported, load from a function like so:
void func() {
  load();

  // access env variables like so:
  print('api key is: ${env['API_KEY']}');

  // can clean the env variables like so:
  clean();
}
```

To deploy on [Cloud Run](https://cloud.google.com/run), follow
[these instructions](https://cloud.google.com/run/docs/quickstarts/build-and-deploy/other).

To run this server locally, run as follows:

```bash
$ dart run bin/github_rest_api.dart
```

-------

# Web App

1. Download and install [Flutter]("https://flutter.dev")
2. Run `flutter build web` from the repo directory
3. Start the API on `localhost:8080`
4. Start a web emulator and run `flutter run` from the project directory

Files relating to the web app are found in `lib/`, with the main method in `lib/main.dart`
