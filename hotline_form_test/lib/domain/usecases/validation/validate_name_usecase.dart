String? validateName(String? name) {

  if (name == null || name.isEmpty) {
    return 'Це поле не може бути пусте.';
  }
  else if (name.length < 2) {
    return 'Ім\'я має містити не менше 2 символів.';
  }
  else if (name.length > 20) {
    return 'Ім\'я занадто довге.';
  }

  return null;

}

