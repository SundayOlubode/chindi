String? validateName(String? text) {
  if (text == null) {
    return "Name can't be empty";
  }

  text = text.trim();

  if (text.isEmpty) {
    return "Name can't be empty";
  }

  return null;
}
