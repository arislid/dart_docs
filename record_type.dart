/// record type is immutable, heterogeneous, and typed
/// Records expressions are comma-delimited lists of named or positional fields, enclosed in parentheses
/// 'first', 'second' -> positional fields
/// a: 1, b: 2 -> named fields
var record = ('first', a: 1, b: 2, 'second');

/// 1, 2, 3, 4 -> positional fields
var record1 = (1, 2, 3, 4);

(String, int) record2 = ("HELLO", 1);

/// You can use record type annotations to define return types and parameter types.
/// Here is the example of using record type with typedef as IntSwap
typedef IntSwap = (int, int);
IntSwap swap(IntSwap record) {
  var (a, b) = record;
  return (b, a);
}

IntSwap swap1(IntSwap record) => (record.$2, record.$1);

/// In a record type annotation,
/// named fields go inside curly brace-delimited section of [type-and-name] pairs,
/// after all positional fields
/// 1. positional fields first
/// 2. named fields are second
(String, {int a, bool b}) records =
    (a: 32, b: true, "Mixed record's type annotation");
void printRecord(record) {
  print(record
      .$1); // imperfect expression. Throws error if the record has no positional instance.
}

/// These are actually different.
/// Names of named fields in a record type are part of record's type definition, or its shape.
/// Named fields with different naames make these records different types.
/// recordAB != recordXY
({int a, int b}) recordAB = (a: 1, b: 2);
({int x, int y}) recordXY = (x: 1, y: 2);

/// In a record type annotation, you can name the [positional fields]
/// but names are just for documentation
/// so those records are the same type.
/// recordAB1 == recordXY1
(int a, int b) recordAB1 = (1, 2);
(int x, int y) recordXY1 = (1, 2);

/// Record fields are accessible through built-in getters.
/// Record fields are immutable(not changeable) so have no setters.
/// Named fields expose getters of the same name.
/// Positional fields expose getters of the name $<position>, skipping nameed fields
void namedFields() {
  print(record); // ('first', 'second', 'a': 1, 'b': 2)
  print(record.$1); // first
  print(record.$2); // second
  print(record.a); // 1
  print(record.b); // 2

  print(record1); // (1, 2, 3, 4)
  print(record1.$1); // 1
}

/// Two records are equal if they have the same shape (set of fields)
/// and their corresponding fields have the same values
/// Since named fields order is not part of a record's shape,
/// the order of named fields do not affect equality
(int a, int b, int c) pointAB = (1, 2, 3);
(int r, int g, int b) color = (1, 2, 3);

equalityRecords(record1, record2) => record1 == record2;

({int a, int b, int c}) pointA = (a: 1, b: 2, c: 3);
({int x, int y, int z}) pointB = (x: 1, y: 2, z: 3);

/// Records automatically define hashCode and == methods based on the structure of their fields.
hashcodeRecords(record) => record.hashCode;

/// Let's apply record to make function that returns multiple-values
(String name, int age) userInfo(Map<String, dynamic> json) =>
    (json['name'] as String, json['age'] as int);

Map<String, dynamic> json0 = {
  'name': 'John',
  'age': 18,
  'id': 24832,
};
// var (name, age) = userInfo(json0);

Map<String, dynamic> json1 = {
  'name': 'Minji',
  'age': 32,
  'id': 21486,
};

({String name, int age}) userInfo0(Map<String, dynamic> json) =>
    (name: json['name'] as String, age: json['age'] as int);
// final (name: name0, age: age0) = userInfo0(json1);


/**
  printRecord(records);
  print(equalityRecords(pointAB, color));
  print(hashcodeRecords(pointAB));
  print(hashcodeRecords(color));

  print(equalityRecords(pointA, pointB));

  print(hashcodeRecords(pointA));
  print(hashcodeRecords(pointB));

  var (name, age) = userInfo(json0);
  final (name: name0, age: age0) = userInfo0(json1);
  print("${name}, ${age}");
  print("${name0}, ${age0}");

  final (name: n, age: a) = userInfo0(json1);

  final (minji, _) = userInfo(json1);
 */