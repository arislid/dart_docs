/// Objects have [members] consisting of functions and data
/// (functions - methods, data - instance variables)
/// When you call a method, you invoke it on an object
///
/// the method has access to that object's functions and data.

class Player {
  /// Class를 단독으로만 사용하지 않고
  Player(String name, int xp) {
    this.name = name;
    this.xp = xp;
  }

  /// property 선언할 때는 type형을 분명하게 적두는 게 좋다.
  /// var name = 'nico'; // not recommended.
  String name = 'nico';
  int xp = 200;

  /// property를 바꾸고 싶지 않다면 final을 넣어두자.
  final String user = 'user';

  ///
  void sayHello() {
    /// dart에서는 this를 굳이 넣을 필요가 없다.
    print("Hi! my name is ${this.name}");

    /// 하지만 method 내에 같은 변수가 있다면 구분지을 필요가 있다.
    var name = 'Sam Altman';
    print("Hi! He is $name");
  }
}

var player = Player("lalala", 23);

/// 클래스 밖에서는 인스턴스 이름을 넣어서 name을 사용하면 된다.
void printPlayer() {
  print("Hi! my name is ${player.name}");
}
