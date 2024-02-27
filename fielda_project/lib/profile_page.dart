import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 35,
            color: Color.fromARGB(230, 51, 93, 234),
          ),
          onPressed: () {
            setState(() {
              _isDrawerOpen = !_isDrawerOpen;
            });
          },
          padding: const EdgeInsets.only(top: 10.0),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help,
              size: 30,
              color: Color.fromARGB(230, 51, 93, 234),
            ),
            onPressed: () {},
            padding: const EdgeInsets.only(top: 15.0, right: 10.0),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Customize drawer header color
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Sidebar Item 1'),
              onTap: () {
                // Handle item tap
              },
            ),
            ListTile(
              title: Text('Sidebar Item 2'),
              onTap: () {
                // Handle item tap
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Color.fromARGB(230, 51, 93, 234),
                      size: 25.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Hamish Leap',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'PROJECTS',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const SizedBox(
              width: 350.0,
              child: Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10.0),
                      Text(
                        'Loading...',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
