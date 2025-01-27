//CÓDIGO DE PRODUÇÃO
class EmailValidator {
  validate({String? email}) {
    // test 1        ||  test 2
    if (email == null || email.isEmpty) {
      return 'Email Required';
    }

    //tests 3 and 4
    // emailRegex IT IS A STANDARD REGEX CODE THAT CHECKS CHARACTERS THAT ARE VALID FOR EMAIL
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    // CHECK IF THE EMAIL WE PROVIDE IS >IN MATCH< WITH THE VALID EMAIL CHARACTERS
    if (emailRegex.hasMatch(email)) {
      // IT MUST GIVE AN ERROR BECAUSE THE CHECK IS IF IT IS INVALID
      return null;
    } else {
      // THE TEST IS APPROVED BECAUSE THIS IS WHAT HE EXPECTS
      return 'Invalid Email';
    }
  }
}
