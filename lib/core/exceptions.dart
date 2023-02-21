class PaymentsApiErrorException implements Exception {
  final String? errorMsg;

  PaymentsApiErrorException({this.errorMsg});

  @override
  String toString() => errorMsg ?? 'Error';
}