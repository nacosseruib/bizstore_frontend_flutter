import 'package:flutter/material.dart';
import '../../../components/constants.dart';
import '../chat/SingleChatWidget.dart';


class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  get liked => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
                  child: Padding(
                   padding: const EdgeInsets.only(left:8.0, top: 3.0, right: 8.0, bottom: 3.0),
                  child: ListView(
                  children: [
                  Card(child: Padding(padding: EdgeInsets.all(10),
                    child:
                        Column(
                          children: [
                              Row(children: [
                                const CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://static3.srcdn.com/wordpress/wp-content/uploads/2017/06/Jaqen-Hghar-Game-of-Thrones.jpg'), backgroundColor: Colors.transparent,),
                                const SizedBox(width: 10,),
                                Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,children: const [
                                  Text("SoftDev Cafe", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                  Text("Subscribe to the channel :)")
                                ],)
                              ],),
                              const SizedBox(height: 5,),
                              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDXCC-UB67rk0HtbmrDvVsIGvnPfTAMc_tSg&usqp=CAU'),
                              const SizedBox(height: 5,),
                              Padding(padding: const EdgeInsets.all(5),child: Row(children: [
                                IconButton(padding: const EdgeInsets.fromLTRB(0, 0, 5, 0), constraints: BoxConstraints(),
                                    onPressed: () {
                                      // setState(() {
                                      //   liked = !liked;
                                      //   if(liked)
                                      //   {
                                      //     liked += 1;
                                      //   }
                                      //   else
                                      //   {
                                      //     liked -= 1;
                                      //   }
                                      // });
                                    }, icon: liked == true ? const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border)),
                                IconButton(padding: EdgeInsets.fromLTRB(0, 0, 5, 0), constraints: BoxConstraints(),
                                    onPressed: () {

                                    }, icon: Icon(Icons.comment_outlined)),
                                IconButton(padding: EdgeInsets.fromLTRB(0, 0, 5, 0), constraints: BoxConstraints(),
                                    onPressed: () {

                                    }, icon: Icon(Icons.bookmark_outline)),
                              ]),),
                              Padding(child: Row(children: [
                                Text(liked.toString() + " likes"),
                              ]), padding: EdgeInsets.all(5),),
                            ],
                        ),
                      ),
                  )

                  ],
                ),
              ),
          ),
          floatingActionButton: FloatingActionButton(
            heroTag: "addPost",
            onPressed: () {},
            backgroundColor: primaryDeepColor,
            tooltip: 'Create Post',
            elevation: 7,
            //splashColor: Colors.grey,
            child: const Icon(Icons.add, color: Colors.white, size: 29,),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
  }
}

