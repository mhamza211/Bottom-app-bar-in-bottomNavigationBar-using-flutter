
import 'package:bottmappbar/chat.dart';
import 'package:bottmappbar/contact.dart';
import 'package:bottmappbar/dashboard.dart';
import 'package:bottmappbar/favourite.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0; // Track the current tab
  final List<Widget> screens = [
    Dashboard(),
    Contact(),
    Chat(),
    Favourite(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard(); // Default screen is Dashboard

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentTab == 0
          ? null // No AppBar for Dashboard
          : AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    currentScreen = Dashboard(); // Navigate back to Dashboard
                    currentTab = 0;
                  });
                },
              ),
              title: Text(
                currentTab == 1
                    ? 'Contact'
                    : currentTab == 2
                        ? 'Chat'
                        : 'Favourite',
              ),
            ),
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: currentTab == 0
          ? FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            )
          : null, // Hide FAB on other screens
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: currentTab == 0
          ? BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Dashboard();
                              currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.dashboard,
                                color: currentTab == 0 ? Colors.blue : Colors.grey,
                              ),
                              Text(
                                'Dashboard',
                                style: TextStyle(
                                    color:
                                        currentTab == 0 ? Colors.blue : Colors.grey),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Contact();
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.contact_emergency_outlined,
                                color: currentTab == 1 ? Colors.blue : Colors.grey,
                              ),
                              Text(
                                'Contact',
                                style: TextStyle(
                                    color:
                                        currentTab == 1 ? Colors.blue : Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 44,
                    ),
                    // Right side of the bottom nav bar
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Chat();
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.chat,
                                color: currentTab == 2 ? Colors.blue : Colors.grey,
                              ),
                              Text(
                                'Chat',
                                style: TextStyle(
                                    color:
                                        currentTab == 2 ? Colors.blue : Colors.grey),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen = Favourite();
                              currentTab = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.heart_broken_sharp,
                                color: currentTab == 3 ? Colors.blue : Colors.grey,
                              ),
                              Text(
                                'Favourite',
                                style: TextStyle(
                                    color:
                                        currentTab == 3 ? Colors.blue : Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          : null, // Hide BottomAppBar on non-home screens
    );
  }
}