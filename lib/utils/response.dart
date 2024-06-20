


class ApiResponse<T>{
  final dynamic data ; 
  final AppError<T>? error ; 
  final int? errors ; 

  ApiResponse({
    this.data , 
    this.errors
    , this.error 
  }) ; 

  bool get isSuccess => error == null ;  // if null : true  

  int get dataLength => data?.length ; 

}

class AppError<T>{
  final dynamic message ; 
  AppError(this.message) ; 
}

class NetworkError<T> extends AppError<T>{
    NetworkError(String message) : super(message) ; 
  }

class DatabaseError<T> extends AppError<T>{
  DatabaseError(String message):super(message) ; 
}

class UnknownError<T> extends AppError<T>{
  UnknownError(String message):super(message) ; 
}





