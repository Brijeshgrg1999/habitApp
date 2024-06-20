class AppError<T>{
  final dynamic message ; 
  AppError(this.message) ; 
}

class NetworkError extends AppError{
    NetworkError(String message) : super(message) ; 
  }

class DatabaseError extends AppError{
  DatabaseError(String message):super(message) ; 
}

class UnknownError extends AppError{
  UnknownError(String message):super(message) ; 
}





