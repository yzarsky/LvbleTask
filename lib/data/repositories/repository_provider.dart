import '../payments/api/payments_api.dart';
import 'payments_repository.dart';

PaymentsRepository getPaymentsRepository({required PaymentsApi paymentsApi}) {
  return PaymentsRepositoryImpl(paymentsApi: paymentsApi);
}