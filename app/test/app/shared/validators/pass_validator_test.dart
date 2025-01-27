import 'package:app/shared/validators/pass_validator.dart';
import 'package:flutter_test/flutter_test.dart';

// TEST INITIALIZE
main() {
  late PassValidator passValidator;

// SETUP FUNCTION TO REUSE WHAT IS REPEATED IN VARIOUS >TEST FUNCTIONS<
  setUp(() => passValidator = PassValidator());

  // TESTS GROUP
  group(
      // WHAT WILL THIS GROUP DO?
      "Validate Password", () {
    // TEST 1
    // WHAT WILL THIS TEST FUNCTION DO?
    test('Return error if password equals null', () {
      final result = passValidator.validate();
      // CHECK IF THE EXPECTED RESULT IS EQUAL TO: Password required
      expect(result, equals('Password required'));
    });

    //TEST 2
    // WHAT WILL THIS TEST FUNCTION DO?
    test('Return error if password is empty', () {
      final result = passValidator.validate(pass: '');
      // CHECK IF THE PASSWORD IS == BLANK
      expect(result, equals('Password required'));
    });

    // TEST 3
    // WHAT WILL THIS TEST FUNCTION DO?
    test('Return error if password is less than 6 characters', () {
      final result = passValidator.validate(pass: 'test');
      // CHECK IF THE PASSWORD IS < 6
      expect(result, equals('The password must have at least 6 characters'));
    });

    //TEST 4
    // WHAT WILL THIS TEST FUNCTION DO?
    test('Return error if password is not alphanumeric', () {
      // TEST WITH + 6 CHARACTERS TO PASS TEST 3
      final result = passValidator.validate(pass: 'testpass');
      // CHECK IF THE PASSWORD IS NOT ALPHANUMERIC
      expect(result, equals('The password must be alphanumeric'));
    });

    //TEST 5
    // WHAT WILL THIS TEST FUNCTION DO?
    test('Return null if password is alphanumeric', () {
      // TEST WITH + 6 CHARACTERS TO PASS TEST 3
      final result = passValidator.validate(pass: 'test1345');
      // CHECK IF THE PASSWORD IS ALPHANUMERIC
      expect(result, isNull);
    });
  });
}
