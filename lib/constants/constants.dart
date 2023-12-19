import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

const kAppName = 'Todoi';
const kAppLogo = 'assets/images/logo.png';
const kUserCollection = 'users';
const kTodosCollection = 'todos';

//Fonts

 String? kFreedokaFont = GoogleFonts.fredoka().fontFamily;

//App Gradient

LinearGradient appGradient() {
  return const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    stops: [
      0.1,
      0.4,
    ],
    colors: [
      kSecondaryColor,
      kMainColor,
    ],
  );
}

String? customValidator(String? val) {
  if (val!.isEmpty) {
    return '*please fill this field';
  }
}
