enum EndPoints {
  login,
  search,
  searchId
}

extension EndPointExtension on EndPoints{
  String val({String? data}){
    switch(this){
      case EndPoints.login:
        return 'api/auth/local';
      case EndPoints.search:
        return 'api/stocks/search';
      case EndPoints.searchId:
        return 'api/stocks/';
    }
  }
}

extension AuthExtension on String{
  bool get requiresBearerToken {
    if( contains(EndPoints.search.val()) ||
      contains(EndPoints.searchId.val())
    ){
      return true;
    } else{
      return false;
    }
  }
}