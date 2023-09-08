class Tourist {
  Tourist({
    this.name = '',
    this.surname = '',
    this.dateOfBirth = '',
    this.nationality = '',
    this.foreignPassportNumber = '',
    this.expiryDateOfThePassport = '',
  });
  final String name;
  final String surname;
  final String dateOfBirth;
  final String nationality;
  final String foreignPassportNumber;
  final String expiryDateOfThePassport;

  static bool validate(List<Tourist> tourists) {
    bool validate(Tourist tourist) {
      if (tourist.expiryDateOfThePassport.isEmpty ||
          tourist.foreignPassportNumber.isEmpty ||
          tourist.nationality.isEmpty ||
          tourist.dateOfBirth.isEmpty ||
          tourist.surname.isEmpty ||
          tourist.name.isEmpty) {
        return false;
      }
      return true;
    }

    bool isFullyLoaded = false;

    for (Tourist tourist in tourists) {
      if (!validate(tourist)) {
        isFullyLoaded = false;
        break;
      }
      isFullyLoaded = true;
    }
    return isFullyLoaded;
  }

  static String convertIndexToWord(int index) {
    String str = '';
    switch (index) {
      case 0:
        str = 'Первый турист';
        break;
      case 1:
        str = 'Второй турист';
        break;
      case 2:
        str = 'Третий турист';
        break;
      case 3:
        str = 'Четвертый турист';
        break;
      case 4:
        str = 'Пятый турист';
        break;
      case 5:
        str = 'Шестой турист';
        break;
      case 6:
        str = 'Седьмой турист';
        break;
      case 7:
        str = 'Восьмой турист';
        break;
      case 8:
        str = 'Девятый турист';
        break;
      case 9:
        str = 'Десятый турист';
        break;
      case 10:
        str = 'Одиннадцатый турист';
        break;
      case 11:
        str = 'Двенадцатый турист';
        break;
      case 12:
        str = 'Тринадцатый турист';
        break;
      case 13:
        str = 'Четырнадцатый турист';
        break;
      case 14:
        str = 'Пятнадцатый турист';
        break;
      case 15:
        str = 'Шестнадцатый турист';
        break;
      case 16:
        str = 'Семнадцатый турист';
        break;
      case 17:
        str = 'Восемнадцатый турист';
        break;
      case 18:
        str = 'Девятнадцатый турист';
        break;
      case 19:
        str = 'Двадцатый турист';
        break;
      case 20:
        str = 'Двадцать первый турист';
        break;
      default:
        str = 'Двадцать второй турист';
        break;
    }
    return str;
  }
}
