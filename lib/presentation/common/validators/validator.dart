String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Phone number required";
  } else if (value.length < 10) {
    return "Phone number must be 10 digits";
  }
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Fullname required";
  }
}

String? userNameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Username required";
  }
}

String? paswwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Password required";
  }

  // Check if the username contains at least one letter
  if (!value.contains(RegExp(r'[a-z]'))) {
    return "Password must contain capital and small letters";
  }

  // Check if the username contains at least one symbol
  if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return "Password must be contain a symbol";
  }

  // Check if the username contains at least one number
  if (!value.contains(RegExp(r'[0-9]'))) {
    return "Password must be contain a number";
  }

  if (value.length < 6) {
    return "Password must be 6 letters";
  }
}
