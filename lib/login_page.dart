import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

Future<void> _login(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String username = usernameController.text;
  String password = passwordController.text;

  if (username == 'aput' && password == 'aput') {
    // Simpan informasi login
    await prefs.setString('username', username);

    // Navigasi ke halaman Home Page
    Navigator.pushReplacementNamed(context, '/home');
  } else {
    // Tampilkan pesan kesalahan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login gagal')),
    );
  }
}

Future<void> _logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('username'); // Menghapus informasi login yang disimpan
  Navigator.pushReplacementNamed(context, '/login'); // Navigasi kembali ke halaman login
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
