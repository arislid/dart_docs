class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

// Who are you?
// What are you doing?
  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

/// [putIfAbsent()]
/// key값을 조회하고 없으면 새 항목에 추가합니다.
/// String 형식을 반환하기 때문에 해당 변수에서 값이 있는지 조사합니다.
void exampleOfputIfAbsent() {
  final diameters = <num, String>{1.0: 'Earth'};
  final otherDiameters = <double, String>{0.383: 'Mercury', 0.949: 'Venus'};

  for (final item in otherDiameters.entries) {
    diameters.putIfAbsent(item.key, () => item.value);
  }
  print(diameters);
}

void main() {
  var logger = Logger("UI");
  // logger.log("Button clicked");

  var logMap = {"name": "UI"};
  var loggerJson = Logger.fromJson(logMap);
  print(logger.name);
  // print(Logger("Flutter").name);
  print(loggerJson); // Instance of 'Logger'
}
