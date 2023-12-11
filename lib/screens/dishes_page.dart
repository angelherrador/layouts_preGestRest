import 'package:flutter/material.dart';

class DishesPage extends StatelessWidget {
  const DishesPage(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('$label'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Text('Familia : $label'),
              ],
            ),
        )

    );
  }
}
