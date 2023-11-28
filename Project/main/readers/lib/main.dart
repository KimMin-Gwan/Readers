import 'package:flutter/material.dart';
import './style.dart' as style;
import './mainPage.dart' as mainPage;
import './buyPage.dart' as buyPage;
import './profile.dart' as profile;
import './settingPage.dart' as setting;
import "./camaraPage.dart" as cameraPage;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  void _onItemTapped(var index){
    setState(() {
      tab = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MainAppBar( tab: tab),
        ),
    /*
        AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text('Readers'),
          titleTextStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.add_box_outlined),
              onPressed: (){},
              iconSize: 30,
            )
          ]
        ),

     */
        // /body: Center(
          //child: Text("${tab}", style: TextStyle(fontSize: 50))
        //),
        body: [mainPage.Home(),
          buyPage.BuyPage(),
          Text('Camera'),
          //cameraPage.CameraPage();
          setting.Setting(),
          profile.Profile(),
          mainPage.Home(),
          ][tab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tab,
          onTap: _onItemTapped,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          //onTap: (i){
            //setState((){
              //print(i);
              // /tab = i;
            //});
           // },
          items: const<BottomNavigationBarItem> [
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

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key, this.tab}) : super(key: key);
  final tab;

  set_title(now_tab){
    String title = "default";

    if(now_tab == 0){
      title = "도서 목록";
    }
    else if(now_tab == 1){
      title = "최저가 검색";
    }
    else if(now_tab == 2){
      title = "표지로 검색";
    }
    else if(now_tab == 3 || now_tab == 4){
      title = "";
    }
    else{
      title = "오늘의 추천 도서";
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration( //앱바와 페이지의 구분을 주기 위해 BoxShadow로 그림자 만들어서 사용.
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(8),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey.withOpacity((0.5)))
                    )
                  ),
                  child: Text("Readers",
                  style: TextStyle(fontSize: 20))
                )
            ),
            flex:1,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Text(this.set_title(this.tab),
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,)
              ),
              flex:2,
            )
          ],
        )
      ),
    );
  }
}
