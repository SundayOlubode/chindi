String? validatePassword(String? text) {
  if (text == null) {
    return "Password can't be empty";
  }

  text = text.trim();

  if (text.isEmpty) {
    return "Password can't be empty";
  }

  if (text.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  return null;
}
