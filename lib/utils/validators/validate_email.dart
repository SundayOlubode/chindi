String? validateEmail(String? text) {
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (text == null) {
    return "Email can't be empty";
  }

  text = text.trim();

  if (text.isEmpty) {
    return "Email can't be empty";
  }

  if (!text.contains('@')) {
    return 'Email must contain @';
  }

  if (!emailRegExp.hasMatch(text)) {
    return 'Invalid email format';
  }

  return null;
}
