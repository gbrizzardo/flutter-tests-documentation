//CÓDIGO DE PRODUÇÃO
class PassValidator {
  String? validate({String? pass}) {
    //TEST 1       ||TEST 2
    if (pass == null || pass.isEmpty) {
      return 'Password Required';
    }

    //TEST 3
    if (pass.length < 6) {
      return 'The password must have at least 6 characters';
    }

    final alphanumeric = RegExp(r"^(?=.*[a-zA-Z])(?=.*[0-9]).+$");
    //TEST 4
    if (alphanumeric.hasMatch(pass)) {
      return null;
    } else {
      return 'The password must be alphanumeric';
    }
  }
}
