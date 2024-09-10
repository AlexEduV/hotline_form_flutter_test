final phoneRegExp = RegExp(r'^\+?[0-9]+$');

String? validatePhone(String? phone) {

  if (phone == null || phone.isEmpty) {
    return 'Це поле не може бути пусте.';
  }
  else if (!phoneRegExp.hasMatch(phone)) {
    return 'Будь ласка, введіть дійсеий номер телефону.';
  }
  else if (phone.length < 10) {
    return 'Номер закороткий.';
  }
  else if (phone.length > 13) {
    return 'Номер задовгий.';
  }

  return null;

}