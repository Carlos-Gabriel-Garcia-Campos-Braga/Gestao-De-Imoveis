import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({String? message}) = NetworkFailure;
  const factory Failure.unauthorized() = UnauthorizedFailure;
  const factory Failure.notFound(String resource) = NotFoundFailure;
  const factory Failure.server({
    required int statusCode,
    String? message,
  }) = ServerFailure;
  const factory Failure.validation({required String message}) = ValidationFailure;
  const factory Failure.unknown({String? message}) = UnknownFailure;
}

extension FailureMessage on Failure {
  String get userMessage => when(
        network: (msg) => msg ?? 'Sem conexão com a internet. Verifique sua rede.',
        unauthorized: () => 'Sessão expirada. Faça login novamente.',
        notFound: (res) => '$res não encontrado.',
        server: (code, msg) => msg ?? 'Erro no servidor ($code). Tente novamente.',
        validation: (msg) => msg,
        unknown: (msg) => msg ?? 'Ocorreu um erro inesperado.',
      );
}
