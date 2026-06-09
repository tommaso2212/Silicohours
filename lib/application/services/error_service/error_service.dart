enum ErrorCategory { validation, network, unknown }

abstract class ErrorService {
  String getErrorMessage(Exception exception);
  ErrorCategory categorizeError(Exception exception);
}
