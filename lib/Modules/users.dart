class Users {
  int _id;
  String _username;
  String _firstName;
  String _lastName;
  String _email;
  String _usrImg;
  String _usrAddress;
  String _usrStore;
  int _usrType;

  Users(
      {int id,
        String username,
        String firstName,
        String lastName,
        String email,
        String usrImg,
        int usrAddress,
        int usrStore,
        int usrType,})
  {
    if (id != null) {
      _id = id;
    }
    if (username != null) {
      _username = username;
    }
    if (firstName != null) {
      _firstName = firstName;
    }
    if (lastName != null) {
      _lastName = lastName;
    }
    if (email != null) {
      _email = email;
    }
    if (usrImg != null) {
      _usrImg = usrImg;
    }
    if (usrStore != null) {
      _usrStore = usrStore as String;
    }
    if (usrType != null) {
      _usrType = usrType;
    }
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get username => _username;
  set username(String username) => _username = username;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  String get email => _email;
  set email(String email) => _email = email;
  String get usrImg => _usrImg;
  set usrImg(String usrImg) => _usrImg = usrImg;
  String get usrAddress => _usrAddress;
  set usrAddress(String usrAddress) => _usrAddress = usrAddress;
  String get usrStore => _usrStore;
  set usrStore(String usrStore) => _usrStore = usrStore;
  int get usrType => _usrType;
  set usrType(int usrType) => _usrType = usrType;

  Users.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _usrImg = json['usr_img'];
    _usrAddress = json['usr_address'];
    _usrStore = json['usr_store'];
    _usrType = json['usr_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['username'] = _username;
    data['first_name'] = _firstName;
    data['last_name'] = _lastName;
    data['email'] = _email;
    data['usr_img'] = _usrImg;
    data['usr_address'] = _usrAddress;
    data['usr_store'] = _usrStore;
    data['usr_type'] = _usrType;
    return data;
  }
}
