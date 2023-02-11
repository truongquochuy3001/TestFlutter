import 'dart:async';

class LoginBloc {
  final StreamController<String> _errorController = StreamController<String>();

  Stream<String> get errorStream => _errorController.stream;
  String get userName => _userName;

  String _userName = "";
  String _password = "";

  set username(String value) {
    _userName = value.trim();
  }

  set password(String value) {
    _password = value.trim();
  }

  bool login() {
    _errorController.sink.add("");
    if (_userName.isEmpty) {
      _errorController.sink.add("khong duoc de trong ten dang nhap");
      return false;
    }

    if (_password.isEmpty) {
      _errorController.sink.add("khong duoc de trong mat khau");
      return false;
    }

    if (_userName == "a1" && _password == "123") {
      return true;
    }

    _errorController.sink.add("tai khoan mat khau khong chinh xac");
    return false;
  }

  void dispose() {
    _errorController.close();
  }
}
