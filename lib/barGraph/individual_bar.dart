void main() {
  tester();
}

void tester() async {
  print("print 2:");
  String value = await callUpFuture();
  print("print 3");
  print("values : $value");
}

Future<String> callUpFuture() {
  print("is this called");
  return Future(() => numbers(50));
}

String numbers(int n) {
  print("1");
  StringBuffer str = StringBuffer();
  for (var i = 0; i < n; i++) {
    str.write(" ${i}");
  }

  return str.toString();
}
