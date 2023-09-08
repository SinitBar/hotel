String fFormatMoneyString(String money) {
  String s = money.replaceAllMapped(
    RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
    (match) => '${match.group(0)} ', // here is the space after group
  );
  s += ' ₽';
  return s;
}
