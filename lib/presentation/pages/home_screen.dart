import 'package:flutter/material.dart';
import 'package:money_trail_proj/presentation/component/carousel_component/carousel_component.dart';
import 'package:money_trail_proj/presentation/pages/activity_transaction.dart';
import 'package:money_trail_proj/presentation/pages/add_transaction.dart';
import 'package:money_trail_proj/presentation/pages/notification_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          // Icon notifikasi
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  ));
            },
          ),
          // Drawer
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              child: Text('Menu Drawer'),
            ),
            // Tambahkan item drawer di sini
          ],
        ),
      ),
      body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: double.infinity,
              child: Center(child: CarouselComponent()),
            ),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Addtransactionpage(), // Navigate to AddTransaction page
            ),
          );
        },
        child: const Icon(Icons.add), // Floating Action Button icon
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Activity',
          ),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  ActivityPage(),
              ),
            );
          }
        },
      )
    );
  } 
  }