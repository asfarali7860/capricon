sealed class DataState<T>{
  const DataState();
}

class DataStateSuccess<T> extends DataState<T>{
  final T data;
  DataStateSuccess({
    required this.data
  });
}

class DataStateError<T> extends DataState<T>{
  final Exception? ex;
  DataStateError({
    this.ex
  });
}