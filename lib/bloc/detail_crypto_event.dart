abstract class DeatailCryptoEvent{
}

class DetailCryptoPageRequest extends DeatailCryptoEvent{
  final String uuid;
  // final String time;
  DetailCryptoPageRequest({required this.uuid});
}