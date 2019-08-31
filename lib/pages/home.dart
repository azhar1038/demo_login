import 'package:flutter/material.dart';

// Used gradient color.
const List<Color> strongBliss = [
  Color(0xfff78ca0),
  Color(0xfff9748f),
  Color(0xfffd868c),
  Color(0xfffe9a8b),
];

class HomePage extends StatelessWidget {
  final Map<String, dynamic> user;

  HomePage({
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          // userDetails contains the details present in sliver appbar.
          var userDetails = Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[

              // The Circle containing user Initials
              CircleAvatar(
                radius: 35,
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                child: Center(
                  child: Text(
                    user['name'][0].toString().toUpperCase(),
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),

              // Contains name and email
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hello',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        user['name'],
                        style: TextStyle(
                          fontSize: 25.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        user['email'],
                        style: TextStyle(
                          fontSize: 12.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Edit icon
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.white,
                onPressed: () {
                  showSnackBar(context);
                },
              ),
            ],
          );

          // It contains details of blogs, followers and following.
          var activityDetail = Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                
                // Blogs
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1.0,
                          color: Color(0xffcdcdcd),
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          user['blogs'].toString(),
                          style:
                              TextStyle(fontSize: 30, color: Color(0xff808080)),
                        ),
                        Text(
                          'Blogs',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff3a3a3a),
                            fontWeight: FontWeight.w300,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Followers
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1.0,
                          color: Color(0xffcdcdcd),
                        ),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          user['followers'].toString(),
                          style:
                              TextStyle(fontSize: 30, color: Color(0xff808080)),
                        ),
                        Text(
                          'Followers',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff3a3a3a),
                            fontWeight: FontWeight.w300,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Following
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Text(
                          user['following'].toString(),
                          style:
                              TextStyle(fontSize: 30, color: Color(0xff808080)),
                        ),
                        Text(
                          'Following',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff3a3a3a),
                            fontWeight: FontWeight.w300,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );

          // Main body consisting of slivers.
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                title: Text(
                  'Project Quote',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () {
                      showSnackBar(context);
                    },
                    color: Colors.white,
                  ),
                ],
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: strongBliss,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: FlexibleSpaceBar(
                    background: Container(
                      padding: EdgeInsets.all(15.0),
                      alignment: Alignment.bottomLeft,
                      child: userDetails,
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    activityDetail,
                    Container(
                      height: 300,
                      alignment: Alignment.center,
                      child: Text(
                        '.. No more feed ..',
                        style: TextStyle(color: Color(0xffcdcdcd)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void showSnackBar(BuildContext context) {
    SnackBar snackbar = new SnackBar(
      content: Text('Function not available yet.'),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
