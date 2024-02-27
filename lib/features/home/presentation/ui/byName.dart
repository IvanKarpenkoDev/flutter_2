import 'package:apiapp/features/home/domain/entity/cat_entity.dart';
import 'package:apiapp/features/home/presentation/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ByName extends StatelessWidget {
  final CatEntity cat;

  const ByName({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Text(
              cat.name,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            Image.network(
              cat.image_link,
              width: 300,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0)),
              child: Text(
                cat.min_max_life_expectancy,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0)),
              child: Text(
                cat.length,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0)),
              child: Text(
                cat.origin,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  
                ),
                borderRadius: BorderRadius.circular(0)
              ),
              child:  ElevatedButton(

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              },
              child: Text('Назад'),
            ),
            )

          ],
        ),
      )),
    );
  }
}
