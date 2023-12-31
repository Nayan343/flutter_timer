abstract class DataState<T>{
  T? data;
  Error? error;
  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T>{
  DataSuccess(T data) : super(data: data);
}

class DataFailure<T> extends DataState<T>{
  DataFailure(Error error) : super(error: error);
}