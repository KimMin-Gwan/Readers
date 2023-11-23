import 'package:flutter/material.dart';
import './style.dart' as style;
import './mainPage.dart' as mainPage;


void main() {
  runApp(
    MaterialApp(
        theme: style.theme,
        home: MyApp()
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Readers'),
            actions: [
              IconButton(
                icon: Icon(Icons.add_box_outlined),
                onPressed: (){},
                iconSize: 30,
              )
            ]
        ),
        body: [mainPage.Home(),
          Text('공유'),
          Text('카메라'),
          Text('설정'),
          Text('프로필')][tab],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: (i){
            setState((){
              print(i);
              tab = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: '홈',
              icon: Icon(Icons.library_books_outlined),
              //activeIcon: Icon(Icons.library_books)
            ),
            BottomNavigationBarItem(
              label: '공유',
              icon: Icon(Icons.share_rounded),
              //activeIcon: Icon(Icons.share_rounded)
            ),
            BottomNavigationBarItem(
              label: '카메라',
              icon: Icon(Icons.camera_enhance_outlined),
              //activeIcon: Icon(Icons.camera_enhance)
            ),
            BottomNavigationBarItem(
              label: '설정',
              icon: Icon(Icons.settings),
              //activeIcon: Icon(Icons.settings)
            ),
            BottomNavigationBarItem(
              label: '프로필',
              icon: Icon(Icons.account_circle),
              //activeIcon: Icon(Icons.account_circle)
            ),
          ],
        ),
    );
  }
}

