import 'package:flutter_test/flutter_test.dart';

// CLASS CREATED TO REPRESENT THE PRODUCTION CODE
class EmailValidator {
  validate({String? email}) {
    // test 1       || test 2
    if (email == null || email.isEmpty) {
      return 'Mandatory email';
    }

    //test 3
    // emailRegex IS A STANDARD REGEX CODE THAT CHECKS CHARACTERS THAT ARE VALID FOR EMAIL
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    // CHECK IF THE EMAIL WE PROVIDE IS >IN MATCH< WITH THE VALID EMAIL CHARACTERS
    if (emailRegex.hasMatch(email)) {
      // IT MUST GIVE AN ERROR BECAUSE THE CHECK IS IF IT IS INVALID
      return null;
    } else {
      // THE TEST IS APPROVED BECAUSE THIS IS WHAT HE EXPECTS
      return 'Invalid email';
    }
  }
}

// TEST STARTER
void main() {
  late EmailValidator emailValidator;

  // SETUP FUNCTION TO REUSE WHAT IS REPEATED IN VARIOUS >TEST FUNCTIONS
  setUp(() => emailValidator = EmailValidator());

  // TESTING GROUP
  group(
      // WHAT WILL THIS GROUP DO?
      'Validate Email', () {
    //TEST 1
    // WHAT WILL THIS TEST FUNCTION DO?
    test('Return error if email equals null', () {
      final result = emailValidator.validate();
      // CHECK IF THE EXPECTED RESULT IS EQUAL TO: Mandatory email
      expect(result, equals('Email obrigatório'));
    });

    //TEST 2
    // WHAT WILL THIS TEST FUNCTION DO?
    test('Return error if email is empty', () {
      final result = emailValidator.validate(email: '');
      // CHECK IF THE EMAIL IS == EMPTY
      expect(result, equals('Mandatory email'));
    });

    //TEST  3
    // WHAT WILL THIS TEST FUNCTION DO?
    test('Return error if email is invalid', () {
      // IF THE EMAIL DOES NOT HAVE @, .COM.... IT IS AN INVALID EMAIL
      final result = emailValidator.validate(email: 'test.br');
      // CHECK IF THE EMAIL IS INVALID
      expect(result, equals('Invalid email'));
    });

    //TEST 4
    // WHAT WILL THIS TEST FUNCTION DO?
    test('Return null if email is valid', () {
      // IF THE EMAIL HAS @, .COM.... IT IS A VALID EMAIL
      final result = emailValidator.validate(email: 'test@com.com.br');
      // CHECK IF THE EMAIL IS NULL
      expect(result, isNull);
    });
  });
}
