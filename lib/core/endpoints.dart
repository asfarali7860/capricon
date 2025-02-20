enum EndPoints {
  login,
  search,
}

extension EndPointExtension on EndPoints{
  String val({String? data}){
    switch(this){
      case EndPoints.login:
        return 'api/auth/local';
      case EndPoints.search:
        return 'api/stocks/search';
    }
  }
}

extension AuthExtension on String{
  bool get requiresBearerToken {
    if( contains(EndPoints.search.val())
    ){
      return true;
    } else{
      return false;
    }
  }
}