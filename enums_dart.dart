enum Keys { term, definition }

/// Instance variables must be final, including those added by mixins
/// All generative constructors must be constant
/// Factory constructors can only return one of the fixed,
/// known enum instances.
/// No other class can be extended as Enum is automatically extended.
enum Level {
  zero(0),
  ten(10),
  hundred(100);

  const Level(this.value);
  final int value;
  // final String name;
}

class EnumTest {
  Keys keys;
  String words;
  List<Map<String, String>>? mapList;

  EnumTest(this.keys, this.words);

  void addList() {}
}

void main() {
  EnumTest test = EnumTest(Keys.term, "term");
  print(Level.hundred.value); // 100
  print(Level.hundred.name); // hundred
  print(Level.zero.index); // 0
}
