import 'package:flutter/material.dart';

final Color backgroundColor = Color(0xFFFFFFFF);
final Color backgroundColor2 = Color(0xFF4A4A58);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
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
                            margin: EdgeInsets.only(top:40, bottom: 5),
                            decoration: BoxDecoration(
                      shape: BoxShape.circle,
                       image: DecorationImage(
                         image: NetworkImage(
                          'https://lh3.googleusercontent.com/OwFsnOq3a4PKuze_-I-8KWdMtqDHPa0HYXTqj7OMZUK8_Xvsmjq1CmFdQvvgtoqU-rIkHQ=s91'
                         ),
                         fit: BoxFit.fill,
                       ),
                     ),
                    ),
                          Text("Petoshopo", style: TextStyle(color: Colors.black, fontSize: 19, fontFamily: "Quicksand")),
                          SizedBox(height: 70),
                          Text("Register customer", style: TextStyle(color: Colors.black, fontSize: 19, fontFamily: "Quicksand")),
                          SizedBox(height: 10),
                          Text("Contact", style: TextStyle(color: Colors.black, fontSize: 19, fontFamily: "Quicksand")),
                          SizedBox(height: 10),
                          Text("App version: 1.0", style: TextStyle(color: Colors.black, fontSize: 19, fontFamily: "Quicksand")),
                          SizedBox(height: 10),
                          Text("@ 2019 Petoshopo,", style: TextStyle(color: Colors.black, fontSize: 19, fontFamily: "Quicksand",)), Text(" All Rights Reserved", style: TextStyle(color: Colors.black, fontSize: 19, fontFamily: "Quicksand"))
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
                                Text("My Cards", style: TextStyle(fontSize: 24, color: Colors.black)),
                                Icon(Icons.settings, color: Colors.black),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text("Transactions", style: TextStyle(color: Colors.white, fontSize: 20),),
                            ListView.separated(
                              shrinkWrap: true,
                                itemBuilder: (context, index) {
                              return ListTile(
                                title: Text("Macbook", style: TextStyle(fontFamily: "Quicksand"),),
                                subtitle: Text("Apple", style: TextStyle(fontFamily: "Quicksand"),),
                                trailing: Text("-2900",style: TextStyle(fontFamily: "Quicksand"))
                              );
                            }, separatorBuilder: (context, index) {
                              return Divider(height: 16);
                            }, itemCount: 10)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
  }