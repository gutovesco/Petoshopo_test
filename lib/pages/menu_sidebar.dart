import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:test_peto/pages/cadastrar_cliente.dart';
import 'package:test_peto/pages/statistics.dart';

import 'colsult_customer.dart';

final Color backgroundColor = Color(0xFFFFFFFF);
final Color backgroundColor2 = Color(0xFF4A4A58);
final Color backgroundColor3 = Color(0xFF77F745);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  int page = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index){
          if(index == 0){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Consultcustomer()));
          }
          if(index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Statistics()));
          }
        },
        index: 1,
        height: 50,
        color: Color(0xFF77F745),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        items: <Widget>[
           IconButton(
            icon: Icon(Icons.person),
            color: Colors.white,
            onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => Consultcustomer()));},
          ),
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.insert_chart),
            color: Colors.white,
            onPressed: () {Navigator.push(context, new MaterialPageRoute(builder: (context) => Statistics()));},
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
            scale: _menuScaleAnimation,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 125,
                      margin: EdgeInsets.only(top: 40, bottom: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://lh3.googleusercontent.com/OwFsnOq3a4PKuze_-I-8KWdMtqDHPa0HYXTqj7OMZUK8_Xvsmjq1CmFdQvvgtoqU-rIkHQ=s91'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text("Petoshopo",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontFamily: "Quicksand")),
                    SizedBox(height: 20),
                    new ListTile(
                      title: new Text('Register Customer', style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: "Quicksand",)), 
                      onTap: (){Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new Signin()));}
                    ),
                    new Divider(
                      color: Colors.black,
                      height: 5.0),
                    new ListTile(
                      title: new Text('About us', style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: "Quicksand",)), 
                      onTap: (){
                showAboutDialog(context: context,
                applicationIcon: FlutterLogo(),
                applicationName: 'Petoshopo',
                applicationVersion: '1.0.0',
                applicationLegalese: 'Developed by Caio Faria Pedroso, Augusto Vesco Raveli and Samuel viado que nao sei o sobrenome \nGithub repo: https://github.com/KyleKun/petoshopo',
                );
              },
                    ),
                    new Divider(
                      color: Colors.black,
                      height: 5.0),
                     new ListTile(
                      title: new Text('@2019 Petoshopo,\n All Rights Reserved', style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: "Quicksand",)), 
                      onTap: () => {}
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.black),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text("PetoShopo", style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: "Quicksand",),),
                    ],
                  ),
                  SizedBox(height: 25),
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Text("Tosa", style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: "Quicksand",)),
                          SingleChildScrollView(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color(0xFF77F745),
                              elevation: 2,
                              child: Container(
                                height: 350,
                                width: double.infinity,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return FlipCard(
                                      //flipOnTouch: false,
                                      front: cardFrontTosa(),
                                      back: cardBackTosa(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 35),
                          Text("Alerta vacinação", style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontFamily: "Quicksand",)),
                          SingleChildScrollView(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color(0xFF77F745),
                              elevation: 2,
                              child: Container(
                                height: 350,
                                width: double.infinity,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return FlipCard(
                                      //flipOnTouch: false,
                                      front: cardFrontTosa(),
                                      back: cardBackTosa(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardFrontTosa() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: Colors.white,
            width: 1.0,
          )),
      child: Container(
          width: 400,
          height: 100,
          child: Row(
            children: <Widget>[
              Padding(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      NetworkImage('http://data.biovet.com.br/file/2018/10/29/H104520-F00000-V006-2000x0.jpeg'),
                ),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Name: "),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Call"),
              )
            ],
          )),
    );
  }

  Widget cardBackTosa() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: Colors.white,
            width: 1.0,
          )),
      child: Container(
          width: 400,
          height: 100,
          child: Row(
            children: <Widget>[
              Padding(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      NetworkImage('http://data.biovet.com.br/file/2018/10/29/H104520-F00000-V006-2000x0.jpeg'),
                ),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Name: "),
                    Text("Phone: "),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget cardFrontVacina() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: Colors.white,
            width: 1.0,
          )),
      child: Container(
          width: 400,
          height: 100,
          child: Row(
            children: <Widget>[
              Padding(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      NetworkImage('http://data.biovet.com.br/file/2018/10/29/H104520-F00000-V006-2000x0.jpeg'),
                ),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Name: "),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Call"),
              )
            ],
          )),
    );
  }

  Widget cardBackVacina() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: Colors.white,
            width: 1.0,
          )),
      child: Container(
          width: 400,
          height: 100,
          child: Row(
            children: <Widget>[
              Padding(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      NetworkImage('http://data.biovet.com.br/file/2018/10/29/H104520-F00000-V006-2000x0.jpeg'),
                ),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Name: "),
                    Text("Phone: "),
                  ],
                ),
              ),
            ],
          )),
    );
  }

}
