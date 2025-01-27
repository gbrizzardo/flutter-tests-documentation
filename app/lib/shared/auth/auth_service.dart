import 'package:app/shared/validators/email_validator.dart';
import 'package:app/shared/validators/pass_validator.dart';

class Auth {
  register(String? emailAuth, String? passAuth) {
    // SEARCH IN THE EmailValidator CLASS FOR THE VERIFICATION RESULT
    final emailError = EmailValidator().validate(email: emailAuth);

    // SEARCH IN THE PassValidator CLASS FOR THE VERIFICATION RESULT
    final passError = PassValidator().validate(pass: passAuth);

    // CHECK IF EMAILERROR IS NULL, IF IT IS NOT THEN CHECK IF PASSERROR IS NULL.
    // IF BOTH ARE OK, RETURN NULL
    return emailError ?? passError;
  }
}
