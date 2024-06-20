import 'package:mongo_dart/mongo_dart.dart';
import 'package:nanohabits/const/app_data.dart';


class mongodbConnection{
  final url = URL ; 

  mongodbConnection()  {
     Connection() ; 
  }

  Future<Db> Connection() async {
    final db =   await Db.create(url) ; 
    await db.open() ; 
    return db ; 
  }

}