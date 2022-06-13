import 'package:flutter/cupertino.dart';

class SubjectProvider with ChangeNotifier {
  String _currentSubject = 'physics';
  String _topic = 'Force';

  void setSubject(String subject) {
    _currentSubject = subject;
    notifyListeners();
  }

  void setTopic(String topic) {
    _topic = topic;
    notifyListeners();
  }

  String get getCurrentSubject => _currentSubject;
  String get getCurrentTopic => _topic;
}
