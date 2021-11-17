import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:get/state_manager.dart';

import 'triple_model.dart';

class RxAsync<Error extends Object, State> {
  final Rx<TripleState<Error, State>> _state;

  RxAsync(State state, {bool loading = true})
      : _state = Rx(TripleState(
          state,
          status: loading ? TripleStatus.waiting : TripleStatus.done,
        ));

  Rx<TripleState<Error, State>> get listener => _state;

  State? get value => _state.value.value;
  _setValue(State value) => _state.value = _state.value.copyWith(value: value);

  TripleStatus get status => _state.value.status;
  _setStatus(TripleStatus value) =>
      _state.value = _state.value.copyWith(status: value);

  Error? get error => _state.value.error;
  _setError(Error? error) => _state.value = _state.value.copyWith(error: error);

  bool get isLoading => _state.value.status == TripleStatus.waiting;

  Future<void> taskEither(
    TaskEither<Error, State> task, {
    void Function()? onStart,
    void Function(State value)? onState,
    void Function(Error error)? onError,
  }) async {
    _setStatus(TripleStatus.waiting);
    if (onStart != null) onStart();
    return task.match(
      (error) {
        _setError(error);
        _setStatus(TripleStatus.error);
        if (onError != null) onError(error);
      },
      (value) {
        _setValue(value);
        _setStatus(TripleStatus.done);
        if (onState != null) onState(value);
      },
    ).run();
  }

  StreamSubscription<State> stream(
    Stream<State> stream, {
    void Function()? onStart,
    void Function(State value)? onState,
    void Function(Exception error)? onError,
  }) {
    _setStatus(TripleStatus.waiting);
    if (onStart != null) onStart();
    return stream.listen((value) {
      _setValue(value);
      _setStatus(TripleStatus.done);
      if (onState != null) onState(value);
    }, onError: (error) {
      _setError(error);
      _setStatus(TripleStatus.error);
      if (onError != null) onError(error);
    });
  }

  Future<void> future(
    Future<State> future, {
    void Function()? onStart,
    void Function(State value)? onState,
    void Function(Exception error)? onError,
  }) {
    _setStatus(TripleStatus.waiting);
    if (onStart != null) onStart();
    return future.then((value) {
      _setValue(value);
      _setStatus(TripleStatus.done);
      if (onState != null) onState(value);
    }, onError: (error) {
      _setError(error);
      _setStatus(TripleStatus.error);
      if (onError != null) onError(error);
    });
  }

  TResult map<TResult>({
    required TResult Function() waiting,
    required TResult Function(State value) state,
    required TResult Function(Error? error) error,
  }) {
    switch (_state.value.status) {
      case TripleStatus.error:
        return error(_state.value.error);
      case TripleStatus.waiting:
        return waiting();
      default:
        return state(_state.value.value);
    }
  }

  TResult transform<TResult>(
    TResult Function(State value, TripleStatus status, Error? error)
        transformer,
  ) {
    return transformer(
      _state.value.value,
      _state.value.status,
      _state.value.error,
    );
  }
}

class RxnAsync<Error extends Object, State> extends RxAsync<Error, State?> {
  RxnAsync({State? state, bool loading = true})
      : super(state, loading: loading);
}
