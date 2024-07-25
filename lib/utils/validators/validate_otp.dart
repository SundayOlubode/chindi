String? validateOtp(String? text) {
  if (text == null) {
    return "OTP can't be empty";
  }

  text = text.trim();

  if (text.isEmpty) {
    return "OTP can't be empty";
  }

  if (text.length != 6) {
    return 'OTP must be 6 characters long';
  }

  return null;
}
