import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({ Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        shape: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 1,
            )
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('READERS',style: TextStyle(fontWeight: FontWeight.bold),),

          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('리뷰',style: TextStyle(fontWeight:FontWeight.w900,fontSize: 18,)),
              SizedBox(width: 550),
              Icon(Icons.chrome_reader_mode),
            ],
          )
        ],
      ) ,
      body:reviewbody()
    );
  }
}

class reviewbody extends StatelessWidget {
  const reviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    //책의 제목과 저자를 나타내는부분
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 3),borderRadius: BorderRadius.all(Radius.circular(3))),
          margin: EdgeInsets.only(top: 10),
          height: 100,
          // color: Colors.brown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("title",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              Text('-',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              Text('저자',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
            ],
          ),
        )),
        Divider(thickness: 3,color: Colors.black,),
        //평점과 리뷰
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 3),borderRadius: BorderRadius.all(Radius.circular(3))),
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        starRate(),
                        Spacer(),
                        Text('아이디'),
                        Text('/'),
                        Text('날짜'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('내용'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
//별평점
starRate(){
  return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (contex,_)=>const Icon(
    Icons.star,
    color:Colors.amber,
  ),
      onRatingUpdate: (rating)=>debugPrint(rating.toString()));
}
