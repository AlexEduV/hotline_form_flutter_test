String? validateName(String? name) {

  if (name == null || name.isEmpty) {
    return 'This Field is required.';
  }
  else if (name.length < 2) {
    return 'The Name should be at least 2 characters.';
  }

  return null;

}

