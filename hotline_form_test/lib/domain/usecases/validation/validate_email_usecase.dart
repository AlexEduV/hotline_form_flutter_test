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