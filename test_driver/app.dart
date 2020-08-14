import 'package:flutter_driver/driver_extension.dart';
import 'package:cbaratoboard/main.dart' as app;

//to run integration tests run the command:
//flutter drive --target=test_driver/app.dart

//to run in a device with performance on:
//flutter drive --target=test_driver/app.dart --profile

void main() {
  // This line enables the extension

  enableFlutterDriverExtension();
  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  app.main();
}
