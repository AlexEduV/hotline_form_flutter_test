
import 'package:hotline_form_test/domain/exception/base_exception.dart';

void validateName(String name) {

  if (name.isEmpty) {
    throw NameEmptyException(message: 'Name cannot be empty.');
  }

  if (name.length < 2) {
    throw NameTooShortException(message: 'Name is too short.');
  }

  if (name.length > 20) {
    throw NameTooLongException(message: 'Name is too long.');
  }
}

class NameEmptyException extends BaseException {
  NameEmptyException({required super.message});
}

class NameTooShortException extends BaseException {
  NameTooShortException({required super.message});
}

class NameTooLongException extends BaseException {
  NameTooLongException({required super.message});
}

