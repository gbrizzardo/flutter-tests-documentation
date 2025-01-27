import 'package:app/shared/auth/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late Auth auth;

  // SETUP FUNCTION TO REUSE WHAT IS REPEATED IN VARIOUS >TEST FUNCTIONS
  setUp(() => auth = Auth());
  //Tests GROUP
  group(
      // WHAT WILL THIS GROUP DO?
      'Validate Registration', () {
    //TEST 1
    // WHAT WILL THIS TEST FUNCTION DO?
    test('Return message for invalid email and password', () {
      final result = auth.register('test', '123');
      // CHECK IF THE RESULT HAS AN INVALID EMAIL (EmailValidator) OR PASSWORD (PassValidator)
      expect(result, isA<String>());
    });

    // TEST 2
    // WHAT WILL THIS TEST FUNCTION DO?
    test('Return message to valid email and password', () {
      final result = auth.register('test@com.br', '123abc');
      // CHECK IF THE RESULT HAS AN INVALID EMAIL(EmailValidator) AND PASSWORD(PassValidator)
      expect(result, isNull);
    });
  });
}
