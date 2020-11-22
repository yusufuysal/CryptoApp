import 'package:cryptoapp/pages/my_investments.dart';
import 'package:flutter/material.dart';
import 'package:cryptoapp/pages/favorites.dart';
import 'package:cryptoapp/pages/main_page.dart';
import 'package:cryptoapp/custom/customAppBar.dart';
import 'package:cryptoapp/misc/route_generator.dart';


void main() {
  runApp(MaterialApp(
    title: 'CryptoApp',
    initialRoute: '/home',
    onGenerateRoute: RouteGenerator.generateRoute,

  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

  List<Widget> _bottomBarPage = <Widget>[
    MainPage(),
    Favorites(),
    MyInvestments(),
  ];

  List<Widget> _appBarSelection = <Widget>[
    AppBar(
      backgroundColor: Color(0xFF002B32),
    ),
    AppBar(
      backgroundColor: Color(0xFF002B32),
    ),
    CustomAppBar()
  ];

  List<Widget> fabList(BuildContext context) {
    return <Widget>[
      null,
      null,
      FloatingActionButton(
        backgroundColor: Color(0xFFFEAD34),
        child: Icon(
          Icons.add,
          color: Colors.grey[850],
          size: 30.0,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/addInvestment');
        },
      )
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF003942),
      body: _bottomBarPage.elementAt(_currentIndex),
      appBar: _appBarSelection.elementAt(_currentIndex),
      floatingActionButton: fabList(context).elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white70,
        currentIndex: _currentIndex,
        backgroundColor: Color(0xFF003942),
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Investments')
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}



