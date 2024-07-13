class CustomInputValidator {
  final RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  final RegExp passwordRegExp = RegExp(r'^(?=.*[A-Za-z]).{7,}$');

  bool emailValidator(String email) {
    return emailRegExp.hasMatch(email);
  }

  bool passwordValidator(String pasword) {
    return true;
    return passwordRegExp.hasMatch(pasword);
  }
}
