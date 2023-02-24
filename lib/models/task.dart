class Task {
  String _name;
  String _initialDate;
  String _endDate;
  bool _status;

  Task(this._name, this._initialDate, this._endDate, this._status);

  String name() => _name;
  String initialDate() => _initialDate;
  String endDate() => _endDate;
  bool status() => _status;

  void setStatus(bool status) => this._status = status;
}
