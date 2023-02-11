import 'dart:async';

class RegisterBloc {
  String _userName = "";
  String _password = "";

  final StreamController<String> _errorController = StreamController();

  set userName(String name) {
    _userName = name.trim();
  }

  set password(String pass) {
    _password = pass.trim();
  }

  String get userName => _userName;

  Stream<String> get errorMess => _errorController.stream;

  bool register() {
    _errorController.sink.add("");

    if (_userName.isEmpty) {
      _errorController.sink.add("khong duoc de trong ten dang nhap");
      return false;
    }

    if (_password.isEmpty) {
      _errorController.sink.add("khong duoc de trong mat khau");
      return false;
    }

    return true;
  }

  bool register2() {
    _errorController.sink.add("");

    if (_userName.isEmpty) {
      _errorController.sink.add("khong duoc de trong ten dang nhap");
      return false;
    }

    return true;
  }

  void dispose() {
    _errorController.close();
  }
}
