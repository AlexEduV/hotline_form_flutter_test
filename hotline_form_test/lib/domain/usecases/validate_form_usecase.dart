final emailRegExp = RegExp(
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
);

String? validateEmail(String? email) {

  if (email == null || email.isEmpty) {
    return 'Це поле не може бути пусте.';
  }
  else if (!emailRegExp.hasMatch(email)) {
    return 'Потрібна адреса накшталт example@exmaple.com';
  }

  return null;

}

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