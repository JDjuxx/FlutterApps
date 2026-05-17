import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app_v2/screens/helpScreen.dart';
import 'package:quiz_app_v2/screens/quizListScreen.dart';

class Startscreen extends ConsumerStatefulWidget {
  const Startscreen({super.key});

  @override
  ConsumerState<Startscreen> createState() => _StartscreenState();
}

class _StartscreenState extends ConsumerState<Startscreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = Container(
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => QuizListScreen()));
            },
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
    );

    if (_selectedPageIndex == 1) {
      activePage = Helpscreen();
    }

    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Ayuda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app), label: 'Salir'),
        ],
        onTap: (index) {
          if (index == 2) {
            exit(0);
          }
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
