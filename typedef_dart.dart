/// typedef allows to create alias for user-custom data types.
/// For example, let's say of List<int>
List<int> reverstListOfNumbers(List<int> list) {
  var reversed = list.reversed;
  return reversed.toList();
}

/// If you want to name the type of 'List<int>' as ListOfInt,
/// then, you just add 'typedef' of your name of the data type.
typedef ListOfInts = List<int>;

typedef UserInfo = Map<String, String>;
String sayHi(UserInfo userInfo) => "Hi! ${userInfo['name']}";
