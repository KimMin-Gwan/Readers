import "package:flutter/material.dart";


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 3, itemBuilder: (c, i){
      return Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.network('https://codingapple1.github.io/kona.jpg'),
                  height: 1500,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Container(
                        height:100,
                      ),
                      Container(
                        child:Text('출판사'),
                      ),
                      Container(
                        child:Text('제목'),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Container(
                            child:Text('')
                          )

                        ]
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[

                        ]
                      )
                    ]
                  )
                )
              ]
            )
          )
        ],
      );
    });
  }
}
