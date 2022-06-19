import 'package:flutter/cupertino.dart';

class SubjectProvider with ChangeNotifier {
  String _currentSubject = 'physics';
  String _topic = 'Force';
  String _heading = 'Force';

  void setSubject(String subject) {
    _currentSubject = subject;
    notifyListeners();
  }

  void setTopic(String topic) {
    _topic = topic;
    notifyListeners();
  }

  void setHeading(String heading) {
    _heading = heading;
    notifyListeners();
  }

  String get getCurrentSubject => _currentSubject;
  String get getCurrentTopic => _topic;
  String get getCurrentHeading => _heading;
}
