String? validatePhone(String? phone) {

  if (phone == null || phone.isEmpty) {
    return 'This Field is required.';
  }
  else if (phone.length < 2) {
    return 'The Phone should be at least 2 characters.';
  }

  return null;

}