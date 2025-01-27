import 'package:app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // EMAIL TESTS GROUP
  group(
      // WHAT WILL THIS GROUP DO?
      "Test Email Field", () {
    // TEST 1
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets(
        "Confirm that the Email TextForm field appears correctly on the screen",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE APP MATERIAL BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE APP MATERIAL
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE EMAIL KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "email"
      final emailKey = find.byKey(const Key("email"));

      // CHECK IF emailKey IS REALLY DISPLAYED ON THE SCREEN
      expect(emailKey, findsOneWidget);
    });

    //TEST 2
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets("Display SnackBar if EMAIL is NULL",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE APP MATERIAL BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE APP MATERIAL
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY]
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE REGISTER KEY MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final button = find.byKey(const Key("register"));

      // SEARCH AND CLICK ON THE BUTTON WITH KEY register
      await widgetTester.tap(button);
      //pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND MAKES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();
      // CHECK IF THERE IS AN ERROR CASE Mandatory email (TO UPPERCASE(UPPERCASE))
      // findsOneWidget MEANS 1 WIDGET THAT CONTAINS THIS
      expect(find.text("Email Required".toUpperCase()), findsOneWidget);
    });

    //TEST 3
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets("Display SnackBar if EMAIL is EMPTY",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE APP MATERIAL BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE APP MATERIAL
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE REGISTER KEY MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "email"
      final campoEmail = find.byKey(const Key("email"));
      // SEARCH AND CLICK ON THE TEXTFORMFIELD WITH KEY email
      await widgetTester.tap(campoEmail);
      //pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND MAKES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // LEAVE THE TEXT OF THE KEY email EMPTY ''
      await widgetTester.enterText(campoEmail, '');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND MAKES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final button = find.byKey(const Key("register"));

      // SEARCH AND CLICK ON THE BUTTON WITH KEY register
      await widgetTester.tap(button);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      //CHECK IF THERE IS AN ERROR CASE Mandatory email (TO UPPERCASE(UPPERCASE))
      //findsOneWidget MEANS 1 WIDGET THAT CONTAINS THIS
      expect(find.text("Email Required".toUpperCase()), findsOneWidget);
    });

    // TEST 4
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets("Display SnackBar if EMAIL is INVALID",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE APP MATERIAL BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE APP MATERIAL
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      //TO RECOVER THE REGISTER KEY MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "email"
      final campoEmail = find.byKey(const Key("email"));
      // SEARCH AND CLICK ON THE TEXTFORMFIELD WITH KEY email
      await widgetTester.tap(campoEmail);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // LEAVE THE TEXT OF THE KEY email INVALID
      await widgetTester.enterText(campoEmail, 'invalid_email');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final button = find.byKey(const Key("register"));

      // SEARCH AND CLICK ON THE BUTTON WITH KEY register
      await widgetTester.tap(button);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // CHECK IF THERE IS AN ERROR CASE Invalid email (TO UPPERCASE(UPPERCASE))
      // findsOneWidget MEANS 1 WIDGET THAT CONTAINS THIS
      expect(find.text("Invalid Email".toUpperCase()), findsOneWidget);
    });

    // TEST 5
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets("No Displays snackbar if the EMAIL is VALID",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE APP MATERIAL BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE APP MATERIAL
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "email"
      final campoEmail = find.byKey(const Key("email"));
      // SEARCH AND CLICK ON THE TEXTFORMFIELD WITH KEY email
      await widgetTester.tap(campoEmail);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // MAKE THE TEXT OF THE KEY email VALID
      await widgetTester.enterText(campoEmail, 'email@valid.com');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final button = find.byKey(const Key("register"));

      // SEARCH AND CLICK ON THE BUTTON WITH KEY register
      await widgetTester.tap(button);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // CHECK IF THERE IS AN ERROR CASE Invalid email (TO UPPERCASE(UPPERCASE))
      // findsNothing EXPECT IT DOES NOT CONTAIN WIDGET SNACKBAR
      expect(find.text("Email inválido".toUpperCase()), findsNothing);
    });
  });

  // PASSWORD TESTING GROUP
  group(
      // WHAT WILL THIS GROUP DO?
      "Test Password Field", () {
    //TEST 1 PASS
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets(
        "Confirm that the password TextForm field appears correctly on the screen",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(
          // IMPORTANT THE APP MATERIAL BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE APP MATERIAL
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE PASS KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "pass"
      final passKey = find.byKey(const Key("pass"));

      // CHECK IF passKey IS REALLY BEING DISPLAYED ON THE SCREEN
      expect(passKey, findsOneWidget);
    });

    //TEST 2 PASS
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets("Show SnackBar if Password is NULL",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE APP MATERIAL BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE APP MATERIAL
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "email"
      final campoEmail = find.byKey(const Key("email"));
      // SEARCH AND CLICK ON THE TEXTFORMFIELD WITH KEY email
      await widgetTester.tap(campoEmail);
      //pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // DEIXA O TEXTO DA KEY email VÁLIDO
      await widgetTester.enterText(campoEmail, 'email@valid.com');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final button = find.byKey(const Key("register"));
      // SEARCH AND CLICK ON THE BUTTON WITH KEY register
      await widgetTester.tap(button);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // CHECK IF THERE IS AN ERROR CASE Mandatory email (TO UPPERCASE(UPPERCASE))
      // findsOneWidget MEANS 1 WIDGET THAT CONTAINS THIS
      expect(find.text("Senha obrigatória".toUpperCase()), findsOneWidget);
    });

    //TEST 3 PASSWORD
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets("Show SnackBar if PASSWORD is EMPTY",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE MATERIAL APP BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE MATERIALAPP
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "email"
      final campoEmail = find.byKey(const Key("email"));
      // SEARCH AND CLICK ON THE TEXTFORMFIELD WITH KEY email
      await widgetTester.tap(campoEmail);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // MAKE THE TEXT OF THE KEY email VALID
      await widgetTester.enterText(campoEmail, 'email@valid.com');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "pass"
      final campoPass = find.byKey(const Key("pass"));
      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "pass"
      await widgetTester.tap(campoPass);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // LEAVE THE KEY pass TEXT EMPTY
      await widgetTester.enterText(campoPass, '');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final button = find.byKey(const Key("register"));
      // SEARCH AND CLICK ON THE BUTTON WITH KEY register
      await widgetTester.tap(button);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // CHECK IF THERE IS AN ERROR CASE Mandatory email (TO UPPERCASE(UPPERCASE))
      // findsOneWidget MEANS 1 WIDGET THAT CONTAINS THIS
      expect(find.text("Password required".toUpperCase()), findsOneWidget);
    });

    // TEST 4 PASS
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets("Show SnackBar if Password is less than 6 characters",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE MATERIAL APP BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE MATERIALAPP
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "email"
      final campoEmail = find.byKey(const Key("email"));
      // SEARCH AND CLICK ON THE TEXTFORMFIELD WITH KEY email
      await widgetTester.tap(campoEmail);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // MAKE THE TEXT OF THE KEY email VALID
      await widgetTester.enterText(campoEmail, 'email@valid.com');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "pass"
      final campoPass = find.byKey(const Key("pass"));
      // SEARCH AND CLICK ON TEXTFORMFIELD WITH KEY pass
      await widgetTester.tap(campoPass);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // KEY TEXT IS LESS THAN 6 CHARACTERS
      await widgetTester.enterText(campoPass, 'curta');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final button = find.byKey(const Key("register"));
      // SEARCH AND CLICK ON THE BUTTON WITH KEY register
      await widgetTester.tap(button);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // CHECK IF THERE IS AN ERROR CASE Mandatory email (TO UPPERCASE(UPPERCASE))
      // findsOneWidget MEANS 1 WIDGET THAT CONTAINS THIS
      expect(
          find.text(
              "The password must have at least 6 characters".toUpperCase()),
          findsOneWidget);
    });

    //TEST 5 PASSWORD
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets("Display SnackBar if Password is alphanumeric",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE MATERIAL APP BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE MATERIALAPP
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "email"
      final campoEmail = find.byKey(const Key("email"));
      // SEARCH AND CLICK ON THE TEXTFORMFIELD WITH KEY email
      await widgetTester.tap(campoEmail);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // MAKE THE TEXT OF THE KEY email VALID
      await widgetTester.enterText(campoEmail, 'email@valid.com');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "pass"
      final campoPass = find.byKey(const Key("pass"));
      // SEARCH AND CLICK ON TEXTFORMFIELD WITH KEY pass
      await widgetTester.tap(campoPass);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // THE KEY pass TEXT WOULD NEED TO BE ALPHANUMERIC
      await widgetTester.enterText(campoPass, '1234567');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final button = find.byKey(const Key("register"));
      // SEARCH AND CLICK ON THE BUTTON WITH KEY register
      await widgetTester.tap(button);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // CHECK IF THERE IS AN ERROR CASE Mandatory email (TO UPPERCASE(UPPERCASE))
      // findsOneWidget MEANS 1 WIDGET THAT CONTAINS THIS
      expect(find.text("The password must be alphanumeric".toUpperCase()),
          findsOneWidget);
    });

    //TEST 6
    //WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets("Does not display snackbar if the password is VALID",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE MATERIAL APP BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE MATERIALAPP
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "email"
      final campoEmail = find.byKey(const Key("email"));
      // SEARCH AND CLICK ON THE TEXTFORMFIELD WITH KEY email
      await widgetTester.tap(campoEmail);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // MAKE THE TEXT OF THE KEY email VALID
      await widgetTester.enterText(campoEmail, 'email@valid.com');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "pass"
      final campoPass = find.byKey(const Key("pass"));
      // SEARCH AND CLICK ON TEXTFORMFIELD WITH KEY pass
      await widgetTester.tap(campoPass);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // THE TEXT OF THE KEY pass WOULD NEED TO BE ALPHANUMERIC
      await widgetTester.enterText(campoPass, '1234567@Ab');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final button = find.byKey(const Key("register"));
      // SEARCH AND CLICK ON THE BUTTON WITH KEY register
      await widgetTester.tap(button);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // CHECK IF THERE IS AN ERROR CASE Mandatory email (TO UPPERCASE(UPPERCASE))
      // findsNothing MUST NOT HAVE THE PHRASE Password must be alphanumeric IN ANY WIDGET
      expect(find.text("The password must be alphanumeric".toUpperCase()),
          findsNothing);
    });
  });

  // GROUP REGISTER BUTTON
  group(
      // WHAT WILL THIS GROUP DO?
      "Validate the Registration button", () {
    //TEST 1 Register
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets("Confirm that the BUTTON appears correctly on the screen",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE MATERIAL APP BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE MATERIALAPP
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE PASS KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final registerButton = find.byKey(const Key("register"));

      // CHECK if register IS REALLY BEING DISPLAYED ON THE SCREEN
      expect(registerButton, findsOneWidget);
    });

    //TEST 2 Register
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets(
        "Confirm that a SNACKBAR appears AFTER clicking the REGISTER BUTTON",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE MATERIAL APP BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE MATERIALAPP
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "email"
      final campoEmail = find.byKey(const Key("email"));
      // SEARCH AND CLICK ON THE TEXTFORMFIELD WITH KEY email
      await widgetTester.tap(campoEmail);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // DEIXA O TEXTO DA KEY email VÁLID
      await widgetTester.enterText(campoEmail, 'invalid_email.com');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "pass"
      final campoPass = find.byKey(const Key("pass"));
      // SEARCH AND CLICK ON TEXTFORMFIELD WITH KEY pass
      await widgetTester.tap(campoPass);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // KEY TEXT IS LESS THAN 6 CHARACTERS
      await widgetTester.enterText(campoPass, 'curta');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final button = find.byKey(const Key("register"));
      // SEARCH AND CLICK ON THE BUTTON WITH KEY register
      await widgetTester.tap(button);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // CHECK if register IS REALLY BEING DISPLAYED ON THE SCREEN
      expect(find.byType(SnackBar), findsOneWidget);
    });

    //TEST 3 register
    // WHAT WILL THIS TESTWIDGET FUNCTION DO?
    testWidgets(
        "Confirm that NO SNACKBAR appears AFTER clicking the REGISTER BUTTON if EMAIL and PASSWORD VALID",

        // PARAMETER/VARIABLE TO USE IN THE FUNCTION (widgetTester)
        (widgetTester) async {
      // pumpWidget RENDERS THE ENTIRE SCREEN, INITIALIZING THE MATERIAL AND REGISTER
      await widgetTester.pumpWidget(

          // IMPORTANT THE MATERIAL APP BECAUSE THE REGISTERSCREEN SCREEN DOES NOT HAVE THE MATERIALAPP
          // AND TO BUILD FLUTTER SCREEN THE MATERIAL IS NECESSARY
          const MaterialApp(home: RegisterScreen()));

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "email"
      final campoEmail = find.byKey(const Key("email"));
      //BUSCA E CLICA NO TEXTFORMFIELD COM KEY email
      await widgetTester.tap(campoEmail);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // DEIXA O TEXTO DA KEY email VÁLIDO
      await widgetTester.enterText(campoEmail, 'email@valid.com');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "pass"
      final campoPass = find.byKey(const Key("pass"));
      // SEARCH AND CLICK ON TEXTFORMFIELD WITH KEY pass
      await widgetTester.tap(campoPass);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // KEY TEXT IS LESS THAN 6 CHARACTERS
      await widgetTester.enterText(campoPass, 'valid123');
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // TO RECOVER THE REGISTER KEY IT MUST BE EXACTLY THE SAME TEXT AS THE KEY DECLARED "register"
      final button = find.byKey(const Key("register"));
      // SEARCH AND CLICK ON THE BUTTON WITH KEY register
      await widgetTester.tap(button);
      // pumpAndSettle RENDERS THE SCREEN AFTER THE CLICK AND LEAVES IT READY FOR THE NEXT COMMAND/TEST
      await widgetTester.pumpAndSettle();

      // CHECK if register IS REALLY BEING DISPLAYED ON THE SCREEN
      expect(find.byType(SnackBar), findsNothing);
    });
  });
}
