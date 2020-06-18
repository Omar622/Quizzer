class Quiz{
  String _ques;
  bool _ans;
  Quiz(this._ques, this._ans);
}

class Manage {
    static int _index = 0, _sco = 0;
    List <Quiz> _data = [
    Quiz('Omar made this app?', true),
    Quiz('Omar is the best engineer ever?', true),
    Quiz('Omar is stupid?(the answer is No..)', false),
  ];

  void goNextQues(){
    _index++;
  }
  void restart(){
    _index = 0;
    _sco = 0;
  }
  void addScore(){
    _sco++;
  }
  bool check(bool userAns) => userAns == _data[_index]._ans;
  int sco() => _sco;
  int quesIndex() => _index;
  int size() => _data.length;
  String getQues() => _data[_index]._ques;
}
