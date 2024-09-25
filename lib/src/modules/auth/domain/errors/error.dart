
abstract class IError {
  String get message;
  StackTrace? get stackTrace;
}

/// The [Error] class represents a error with a message and an optional stack trace.
class Error implements IError {
  @override
  final String message;
  @override
  final StackTrace? stackTrace;

  const Error(this.message, [this.stackTrace]);
}

/// The [DomainError] class represents errors related to domain-specific logic.
class DomainError extends Error {
  const DomainError(super.message, [super.stackTrace]);
}

/// The [ExternalError] class represents an error originating from an external source.
class ExternalError extends Error {
  const ExternalError(super.message, [super.stackTrace]);
}

/// The [InfraError] class represents an error related to infrastructure issues.
class InfraError extends Error {
  const InfraError(super.message, [super.stackTrace]);
}
