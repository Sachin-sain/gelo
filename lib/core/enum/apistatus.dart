enum ApiStatus {
  loading,
  success,
  failure;

  bool get isLoading => this == ApiStatus.loading;

  bool get isSuccess => this == ApiStatus.success;

  bool get isFailure => this == ApiStatus.failure;
}
enum AnswerType { yes, no }