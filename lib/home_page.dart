import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:tugas3_pmb/biodata_page.dart';
import 'package:tugas3_pmb/side_menu.dart';

class HomePage extends StatelessWidget {
  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('username'); 
    return userName ?? 'Pengguna'; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<String>(
              future: getUserName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Menampilkan loading jika data belum tersedia
                  return CircularProgressIndicator();
                } else {
                  // Menampilkan nama pengguna setelah data tersedia
                  return Text('Selamat Datang, ${snapshot.data} di Home Page!');
                }
              },
            ),
          ],
        ),
      ),
      drawer: SideMenu(),
    );
  }
}
