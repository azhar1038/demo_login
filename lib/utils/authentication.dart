// Mock Authenticator class which pretends to fetch data from database by using Future.delayed
class Authenticator{

  static List<_User> users = [
    _User('Ramesh', 'ramesh@gmail.com', 'ramesh', 10, 27, 10),
    _User('Suresh', 'suresh@gmail.com', 'suresh', 18, 57, 74),
    _User('Your Name', 'your@email.com', 'yourPassword', 13, 56, 93),
  ];
  
  static Future<Map<String, dynamic>> authenticate(String email, String password) async {
    await Future.delayed(Duration(seconds: 2,),);
    for(int i=0; i<users.length; i++){
      if(users[i].userEmail == email && users[i].userPassword == password){
        _User user = users[i];
        return {
          'name':user.userName,
          'email':user.userEmail,
          'blogs':user.userBlogs,
          'followers':user.userFollowers,
          'following':user.userFollowing,
        };
      }
    }
    return null;
  }
}

class _User{
  String name;
  String email;
  String password;
  int numberOfBlogs;
  int numberOfFollowers;
  int numberOfFollowing;

  _User(String name, String email, String password, int numberOfBlogs, int numberOfFollowers, int numberOfFollowing){
    this.name = name;
    this.email = email;
    this.password = password;
    this.numberOfBlogs = numberOfBlogs;
    this.numberOfFollowers = numberOfFollowers;
    this.numberOfFollowing = numberOfFollowing;
  }

  String get userName => name;
  String get userEmail => email;
  String get userPassword => password;
  int get userBlogs => numberOfBlogs;
  int get userFollowers => numberOfFollowers;
  int get userFollowing => numberOfFollowing;
}