import 'package:flutter/material.dart';
import './reviewPage.dart';

class SellingInfo extends StatelessWidget {
  const SellingInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(


        body:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(height: 300,
                color: Colors.white70,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('camera.jpeg'),
                    VerticalDivider(thickness: 3,color: Colors.black,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('출판사',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Text('우리집'),

                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('제목',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child:Text('너의 이름은 뭐니?')
                            )
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.perm_identity_rounded),
                            Text('저자',style: TextStyle(fontSize: 10)),
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Text('정현'),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.reviews),
                            Text('리뷰',style:TextStyle(fontSize: 10)),
                            Container(
                              margin: EdgeInsets.only(left: 8), // 원하는 간격으로 조절
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('상세 보기'),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.date_range),
                            Text('날짜',style:TextStyle(fontSize: 10)),
                            Container(
                              margin: EdgeInsets.only(left: 8), // 원하는 간격으로 조절
                              child: ElevatedButton(
                                onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const ReviewPage()));
                                },
                                child: Text('리뷰 보기'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),),
              Divider(thickness: 3,color: Colors.black,),
              Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                  child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('교보문고'),
                        Text('8000원')
                      ],
                    ),),
                    ListTile(title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('교보문고'),
                        Text('8000원')
                      ],
                    ),),
                  ],
                )),
            ],
        )
      )
    );
  }
}

class Bmenu extends StatelessWidget {
  const Bmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.menu_book_outlined),
          Icon(Icons.share),
          Icon(Icons.camera_alt),
          Icon(Icons.settings),
          Icon(Icons.perm_identity_rounded)
        ],
      ),
    );
  }
}
