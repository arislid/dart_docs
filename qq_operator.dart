const ternary = "ternary";
const k_ternary = "셋으로 이루어지는, 세 겹의, 세 번째의, 3진의, 3변수의, 3을 기수로 하는, 제 3위의";
const ternary_operator = "ternary operator";
const k_ternary_operator = "삼항 연산자";

/// expressed using the ternary operator
String capitalizeNameTernaryOperator(String? name) =>
    name == null ? "Anonymous" : name.toUpperCase();

/// simply expressed using the qq operator
String capitalizeNameQQOperator(String? name) =>
    name?.toUpperCase() ?? "Anonymous";

/// You can use the ternary operator in Dart to express multi-condition statements,
/// similar to how it's done in Javascript.
/// The syntax is very similar.
String exampleMultiContitionTernaryOperator(
        bool cond1, bool cond2, bool cond3) =>
    cond1
        ? 'value1'
        : cond2
            ? 'value2'
            : cond3
                ? 'value3'
                : 'value4';

/// qq assignment operator '??='
/// This operator assigns the right value if the left is null.
String? qqAssignmentOperator(String? value) {
  String? res;
  res ??= value;
  return res;
}
