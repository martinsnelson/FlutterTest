import 'package:flutter_driver/flutter_driver.dart';
import 'package:ozzie/ozzie.dart';
import 'package:test/test.dart';

void main() {
  group('CBARATO BOARD App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;
    Ozzie ozzie;

    // group('CBARATO BOARD App', () {
    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      ozzie = Ozzie.initWith(driver, groupName: 'cbaratoboard');
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
      ozzie.generateHtmlReport();
    });

    test('starts at 0', () async {
      await ozzie.profilePerformance('counter', () async {
        // Use the `driver.getText` method to verify the counter starts at 0.
        expect(await driver.getText(counterTextFinder), "0");
        await ozzie.takeScreenshot('verify_the_counter_starts_empty');
      });
    });

    test('increments the counter', () async {
      await ozzie.profilePerformance('increments_counter', () async {
        // First, tap the button.
        await driver.tap(buttonFinder);

        // Then, verify the counter text is incremented by 1.
        expect(await driver.getText(counterTextFinder), "1");
        await ozzie.takeScreenshot('increments_greater_than_empty');
      });
    });
  });
}
