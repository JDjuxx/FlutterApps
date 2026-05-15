import 'package:flutter/material.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment(0, 0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(193, 255, 81, 37),
            Color(0xFFFAA754),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircularText(
            //   radius: 150,
            //   children: [
            //     TextItem(
            //       text: Text(
            //         'Desafia Tu Mente',
            //         style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //               color: Colors.amber,
            //               fontSize: 30,
            //             ),
            //       ),
            //       startAngle: -170,
            //       space: 11,
            //       direction: CircularTextDirection.clockwise,
            //     ),
            //   ],
            // ),
            Text(
              'Desafia Tu Mente',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Color(0xFF0D0D0D),
                    fontSize: 30,
                  ),
            ),
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                'assets/images/logo.jpg',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromARGB(125, 255, 81, 37),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                side: BorderSide(width: 1, color: Color(0xFFFF5025)),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
              child: Text(
                'Crear Quiz',
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromARGB(125, 255, 81, 37),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                side: BorderSide(width: 1, color: Color(0xFFFF5025)),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
              child: Text(
                'Hacer Quiz',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Ayuda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app), label: 'Salir'),
        ],
      ),
    );
  }
}
