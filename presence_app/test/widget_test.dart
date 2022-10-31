main() {
  Stream.periodic(const Duration(seconds: 1), (x) => x).listen((x) {
    print(x);
  });
}
