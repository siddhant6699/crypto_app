abstract class DeatailCryptoEvent{
}

class DetailCryptoPageRequest extends DeatailCryptoEvent{
  final String uuid;
  DetailCryptoPageRequest({required this.uuid});
}