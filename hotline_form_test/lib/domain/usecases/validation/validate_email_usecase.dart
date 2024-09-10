String? validateEmail(String? email) {

  if (email == null || email.isEmpty) {
    return 'This Field is required.';
  }
  else if (email.length < 2) {
    return 'The Email should be at least 2 characters.';
  }

  return null;

}