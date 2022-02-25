import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'insta.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<Insta> InstaList = [
    Insta(imguser: 'assets/images/Y1.jpg', img: 'assets/images/Y2.jpg',
        userpost: 'Friend', comments: [Comments(user: 'Darlene', comment: "Dream big and dare to fail😭"),
          Comments(user: 'Olivia', comment: 'Turn your wounds into wisdom❤')],
        caption: "Life would be tragic if it weren’t funny"),
    Insta(imguser: 'assets/images/CH.jpg', img: 'assets/images/MOM.jpg',
        userpost: 'family',comments: [Comments(user: 'Chinchang', comment: 'Happy birthday our valentine mom ❤'),
          Comments(user: 'Misae', comment: 'I love you my sun💚💚💚')],
        caption: '🎂HAPPY BIRTHDAY TO Misae'),
    Insta(imguser: 'assets/images/M1.jpg', img: 'assets/images/Y3.jpg',
        userpost: 'Boyfriend',comments: [Comments(user: 'MANOP', comment: 'LOVE YOU 💙 I MISS SO MUCH 🔥🔥🔥'),
          Comments(user: 'WANNAPA', comment: '💚💚💚')],
        caption: '💝 I LOVE YOU 💝 \n Be heroes of me own stories 💞 💞'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(title: Text('InstaTown',
          style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,))),
      body: ListView.builder(
          itemCount: InstaList.length,
          itemBuilder: (context, index) =>
              MyCard(insta: InstaList[index])),

    );
  }
}
class MyCard extends StatefulWidget {
  final Insta insta;

  const MyCard({
    Key? key,
    required this.insta,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(covid.date),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.insta.imguser}'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                        '${widget.insta.userpost}'
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.insta.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                /*SizedBox(width: 5.0),*/
                Expanded(
                    child: Text(
                        '${widget.insta.caption}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.insta.comments.length;i++)
                  Row(
                    children: [
                      SizedBox(height: 23.0,),
                      Text(
                        '${widget.insta.comments[i].user}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        '${widget.insta.comments[i].comment}',
                        style: TextStyle(

                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),


          Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  like = !like;
                });
              }, icon: like? Icon(Icons.favorite,color: Colors.red,): Icon(Icons.favorite_border),),
              Expanded(
                child: TextField(
                  onSubmitted: (value){

                    setState(() {
                      widget.insta.comments.add(Comments(user: 'Flutter', comment: value));
                      controller.clear();

                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}