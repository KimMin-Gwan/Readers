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
      setState(() {
        this.bookListData = jsonDecode(utf8.decode(result.bodyBytes));
      });
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
                                'https://cdn-icons-png.flaticon.com/512/5434/5434056.png'),
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
                                                                          context) => search.SearchAuthor()),
                                                                );
                                                              },
                                                              //child: Text("저자"))
                                                              child: Text(this.bookListData[i]["author"]))
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
                                                                      builder: (context) => search.SearchAuthor()),
                                                                );
                                                              },
                                                              //child: Text("2021년 08월 26일"))
                                                            child: Text(this.bookListData[i]["publishedDate"]))
                                                        ]
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(1),
                                                    child: Row(
                                                        children: [
                                                          Icon(Icons.share_location),
                                                          TextButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (
                                                                          context) => search.SearchAuthor()),
                                                                );
                                                              },
                                                              child: Text("판매처"))
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
                                              MaterialPageRoute(builder: (context) => BookInfo(bid:this.bookListData[i]["bid"])));
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
