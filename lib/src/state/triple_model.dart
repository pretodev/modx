import 'package:meta/meta.dart';

@immutable
class TripleState<Error extends Object, State> {
  final TripleStatus status;
  final Error? error;
  final State value;

  const TripleState(
    this.value, {
    this.status = TripleStatus.waiting,
    this.error,
  });

  TripleState<Error, State> copyWith({
    TripleStatus? status,
    Error? error,
    State? value,
  }) {
    return TripleState<Error, State>(
      value ?? this.value,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TripleState<Error, State> &&
        other.status == status &&
        other.error == error &&
        other.value == value;
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ value.hashCode;

  @override
  String toString() =>
      'TripleState(status: $status, error: $error, value: $value)';
}

enum TripleStatus { done, error, waiting }

extension TripleStatusExtension on TripleStatus {
  TResult map<TResult>({
    required TResult Function() done,
    required TResult Function() error,
    required TResult Function() waiting,
  }) {
    switch (this) {
      case TripleStatus.done:
        return done();
      case TripleStatus.error:
        return error();
      case TripleStatus.waiting:
        return waiting();
    }
  }
}
