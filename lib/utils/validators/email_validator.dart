String? emailValidator(String? text) {
  if (text == null) {
    return "Email can't be empty";
  }

  if (!text.contains('@')) {
    return 'Email is invalid';
  }

  return null;
}
