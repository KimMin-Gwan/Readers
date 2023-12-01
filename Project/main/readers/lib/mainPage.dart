import "package:flutter/material.dart";
import "./search.dart" as search;
import "./bookInfo.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //List<dynamic> bookListData = [];
  var bookListData = [];

  getData() async {
    var result = await http.get(Uri.http('127.0.0.1:8000', '/homePage'));
    if (result.statusCode == 200) {
      print(utf8.decode(result.bodyBytes));
      setState(() {
        this.bookListData = jsonDecode(utf8.decode(result.bodyBytes));
      });
      print( this.bookListData );
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
    print(this.bookListData);
    return HomePage(bookListData : this.bookListData);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, this.bookListData});
  final bookListData;

  @override
  Widget build(BuildContext context) {
    print(bookListData);

    if (this.bookListData.isNotEmpty) {
      return ListView.builder(
          itemCount: this.bookListData.length, itemBuilder: (c, i) {
        return Column(
          children: [
            //검색창
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '검색어를 입력하세요',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 10.0, 0),
                    child: Icon(Icons.search),
                  ),
                ),

                onChanged: (value){
                  //입력값을 실시간 처리 가능->실시간 검색기능 구현은 해당 함수 내에서ok
                  //검색 로직 구현

                  //if)엔터키~ onSubmitted: 사용하면 될듯
                },
                //(SingleChildScrollView: Textfield에 의해 키보드 활성화 되었을 때,
                // 화면 스크롤 가능. 픽셀 문제 해결할듯)
              ),
            ),
            
            Container(
                margin: EdgeInsets.all(20),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          bottom: BorderSide(
                              color: Colors.grey.withOpacity(0.3)),
                        )
                    ),
                    padding: EdgeInsets.all(14),
                    height: 190,
                    child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                                'https://marketplace.canva.com/EAD12irp-Wk/1/0/1003w/canva-%EC%9D%BC%EB%AA%B0-%EB%A1%9C%EB%A7%A8%EC%8A%A4-%EC%A0%84%EC%9E%90%EC%B1%85-%ED%91%9C%EC%A7%80-rhOetH7hcqE.jpg'),
                          ),
                          //Expanded(
                          //child: Container(
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Text("출판사", style: TextStyle( fontSize: 10, fontWeight: FontWeight.w100)),
                                  Text(this.bookListData[i]["publisher"],
                                      style: TextStyle(fontSize: 10,
                                          fontWeight: FontWeight.w100)),
                                  Text(this.bookListData[i]["title"], style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800)),
                                  //Text(this.bookListData[i]["title"], style: TextStyle( fontSize: 25, fontWeight: FontWeight.w800)),
                                  Row(
                                      children: [
                                        Container(
                                            child: Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(1),
                                                    child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .account_balance_outlined),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (
                                                                          context) =>
                                                                          search
                                                                              .SearchAuthor()),
                                                                );
                                                              },
                                                              //child: Text("저자"))
                                                              child: this.bookListData[i]["writer"])
                                                        ]
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(1),
                                                    child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .speaker_notes),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (
                                                                          context) =>
                                                                          search
                                                                              .SearchAuthor()),
                                                                );
                                                              },
                                                              //child: Text("리뷰수"))
                                                              child: Text("리뷰수"))
                                                        ]
                                                    ),
                                                  ),
                                                ]
                                            )
                                        ),
                                        Container(
                                            child: Column(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(1),
                                                    child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .calendar_month),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (
                                                                          context) =>
                                                                          search
                                                                              .SearchAuthor()),
                                                                );
                                                              },
                                                              //child: Text("2021년 08월 26일"))
                                                            child: this.bookListData[i]["publishedDate"])
                                                        ]
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(1),
                                                    child: Row(
                                                        children: [
                                                          Icon(Icons
                                                              .share_location),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (
                                                                          context) =>
                                                                          search
                                                                              .SearchAuthor()),
                                                                );
                                                              },
                                                              child: Text(
                                                                  "판매처"))
                                                        ]
                                                    ),
                                                  ),
                                                ]
                                            )
                                        ),
                                      ]
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(1),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (
                                                  context) => const BookInfo()));
                                        },
                                        child: Text("상세 정보"),
                                      )
                                  ),
                                ],
                              )
                          )
                          //)
                        ]
                    )
                )
            )
          ],
        );
      });
    }
    else{
      return Text("로딩중");
    }
  }
}
