import 'package:flutter/material.dart';
import 'package:money_trail_proj/presentation/component/carousel_component/carousel_component.dart';
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
          children: const <Widget>[
            DrawerHeader(
              child: Text('Menu Drawer'),
            ),
            // Tambahkan item drawer di sini
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: const SizedBox(
              child: Center(child: CarouselComponent()),
            ),
          ),
          Container(
            height: 40,
            
          )
        ],
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AddTransaction(), // Navigate to AddTransaction page
            ),
          );
        },
        child: const Icon(Icons.add), // Floating Action Button icon
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      )
    );
    }
  }