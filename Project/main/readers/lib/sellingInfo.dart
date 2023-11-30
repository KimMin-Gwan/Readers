import 'package:flutter/material.dart';
import './reviewPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SellingInfo extends StatefulWidget {
  const SellingInfo({super.key});

  @override
  State<SellingInfo> createState() => _SellingInfoState();
}

class _SellingInfoState extends State<SellingInfo> {

  var sellInfoData = [];

  getData() async {
    var result = await http.get(Uri.http('127.0.0.1:8000', '/homePage'));
    if (result.statusCode == 200) {
      print(utf8.decode(result.bodyBytes));
      setState(() {
        this.sellInfoData = jsonDecode(utf8.decode(result.bodyBytes));
      });
      print( this.sellInfoData );
    } else {
      throw Exception('Data Fail to Get');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print(this.sellInfoData);
    return SubSellInfo( sellInfoData :this.sellInfoData);
  }
}

class SubSellInfo extends StatelessWidget {
  const SubSellInfo({super.key, this.sellInfoData});
  final sellInfoData;

  @override
  Widget build(BuildContext context) {
    print(sellInfoData);
    if(this.sellInfoData.isNotEmpty){
      return Column(
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
                        Text("출판사",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text(this.sellInfoData[0]["publisher"]),

                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("제목",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Container(
                            margin: EdgeInsets.only(left: 8),
                            child:Text(this.sellInfoData[0]["title"])
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
                          child: Text(this.sellInfoData[0]["author"]),
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
                      Text(this.sellInfoData[0]["purchaseLink"]),
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
      );
    }else{
      return Text("로딩중");
    }
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
