class MaskedTextControllerHelper {
  static const String _mask = '***) ***-**-**';
  static const int amount = 10;
  final List<int> _numbers = List.filled(amount, amount);

  String userString() {
    final charList = List.generate(_mask.length, (index) {
      if (_mask[index] == ' ' || _mask[index] == ')' || _mask[index] == '-') {
        return _mask[index];
      }
      if (index < 3) {
        if (_numbers[index] != amount) {
          return _numbers[index];
        } else {
          return _mask[index];
        }
      } else if (index < 8) {
        if (_numbers[index - 2] != amount) {
          return _numbers[index - 2];
        } else {
          return _mask[index];
        }
      } else if (index < 11) {
        if (_numbers[index - 3] != amount) {
          return _numbers[index - 3];
        } else {
          return _mask[index];
        }
      } else {
        if (_numbers[index - 4] != amount) {
          return _numbers[index - 4];
        } else {
          return _mask[index];
        }
      }
    });
    return charList.join('');
  }

  void _getNumbersFromMasked(String masked) {
    int numIndex = 0;
    for (int i = 0; i < masked.length; i++) {
      if ('0123456789'.contains(masked[i])) {
        _numbers[numIndex] = int.parse(masked[i]);
      } else if (masked[i] == '*') {
        _numbers[numIndex] = amount;
      } else {
        continue;
      }
      numIndex++;
    }
  }

  String changeMaskWithUserData(String masked) {
    int matchIndex = masked.indexOf('*');
    if (matchIndex != -1) {
      masked = masked.substring(0, masked.indexOf('*'));
      masked = masked + _mask.substring(masked.length);
    } else {
      // then can only delete, can't add // end or delete
      if (masked.length > _mask.length) {
        // user can't add because riches mask length
        return masked.substring(0, _mask.length);
      }
      if (masked.length < _mask.length) {
        // user deleting characters
        masked = masked + _mask.substring(masked.length);
      }
    }
    _getNumbersFromMasked(masked);
    return userString();
  }
}
