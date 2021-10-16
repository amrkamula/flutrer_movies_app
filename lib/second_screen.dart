import 'package:flutter/material.dart';

import 'models.dart';

class SecondScreen extends StatefulWidget {
  final Movie movie;
  SecondScreen({required this.movie});
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Movie? _movie;

  @override
  void initState() {
    _movie = widget.movie;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white,)),
            SizedBox(width: 10.0,),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.35,
                    child: Image.network('https://image.tmdb.org/t/p/w500${_movie!.posterUrl}',fit: BoxFit.fill,),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12.0),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.28,
                          width: MediaQuery.of(context).size.width*0.3,
                          child: Image.network('https://image.tmdb.org/t/p/w500${_movie!.posterUrl}',fit: BoxFit.fill,),
                        ),
                        Expanded(child: Container(
                          height: MediaQuery.of(context).size.height*0.28,
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text('${_movie!.title}',style: TextStyle(color: Colors.grey[700],fontSize: 18.0,fontWeight: FontWeight.bold),),
                                  ),
                                  Text('${_movie!.overview}',maxLines:2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey[600],fontSize: 16.0),),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text('${_movie!.releaseDate} (Released)',style: TextStyle(color: Colors.grey[600],fontSize: 16.0),),
                                  ),
                                  Expanded(child: Center(child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: TextButton(
                                      child: Text('Reviews',style: TextStyle(color: Colors.white,fontSize: 16.0),),
                                      onPressed: (){

                                      },
                                    ),
                                  ),)),
                                ],
                          ),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[300],
                    width: double.infinity,
                    height: 5.0,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12.0),
                    width: double.infinity,
                    height:MediaQuery.of(context).size.height*0.15,
                    child: Row(
                      children: [
                        CustomElement(text: '${_movie!.voteCount} votes', child: Text('${_movie!.voteAverage}',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        )),
                        CustomElement(text: 'Action', child: Icon(Icons.theater_comedy,color: Colors.white,) ),
                        CustomElement(text: 'Popularity', child: Text('${_movie!.popularity!.toStringAsFixed(0)}',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14.0),
                        )),
                        CustomElement(text: 'Language', child: Text('${_movie!.language}',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[300],
                    width: double.infinity,
                    height: 5.0,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20.0),
                    child: Text('${_movie!.overview}',style: TextStyle(fontSize: 18.0,height: 1,color: Colors.grey[700]),),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.teal,
                        child: Icon(Icons.star,color: Colors.white,),
                      ),
                      SizedBox(width: 20.0,),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class CustomElement extends StatelessWidget {
  final String text;
  final Widget child;
  CustomElement({required this.text,required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            Expanded(child: CircleAvatar(
              radius: 25.0,
              child: CircleAvatar(
                radius: 23.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 21.0,
                  backgroundColor: Colors.red,
                  child: Center(
                    child: child,
                  ),
                ),
              ),
              backgroundColor: Colors.red,
            )),
            Text('$text',style: TextStyle(color: Colors.grey,fontSize: 16.0),),
          ],
        ),
      ),
    );
  }
}
