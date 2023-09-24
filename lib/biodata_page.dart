import 'package:flutter/material.dart';

class BiodataPage extends StatelessWidget {
  const BiodataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata Saya'),
      ),
      body: Center(
        child: const Text('Halo, saya Raudhotin Eka Putri NIM H1D021014'),
      ),
    );
  }
}
