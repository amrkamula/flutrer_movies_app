import 'package:flutter/material.dart';
import 'package:flutter_app_movies_app/category_provider.dart';
import 'package:flutter_app_movies_app/network_handler.dart';
import 'package:flutter_app_movies_app/second_screen.dart';
import 'package:provider/provider.dart';

import 'models.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CategoryProvider(),
      child: Consumer<CategoryProvider>(
        builder: (context,provider,child){
          return Scaffold(
            appBar: AppBar(
              actions: [
                PopupMenuButton(
                  initialValue: provider.selectedCategory,
                  onSelected: (int val){
                    provider.changeCategory(val);
                  },
                  itemBuilder:(context)=>[
                    PopupMenuItem(child: Text('${provider.categories[0]}'),value: 0,),
                    PopupMenuItem(child: Text('${provider.categories[1]}'),value: 1,),
                    PopupMenuItem(child: Text('${provider.categories[2]}'),value: 2,),
                  ],
                  child: Icon(Icons.more_vert,color: Colors.white,),),
                SizedBox(width: 20.0,),
              ],
              backgroundColor: Colors.pink,
              title: Text('${provider.categories[provider.selectedCategory]}',style: TextStyle(color: Colors.white),),
            ),
            body: FutureBuilder(
              future: NetworkHandler.getMovies(provider.selectedCategory+1),
              builder: (context,AsyncSnapshot<Map> snapshot){
                if(snapshot.hasData){
                  List movies = snapshot.data!['results'];
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8
                    ),
                    itemBuilder: (context,index){
                      Movie movie = Movie.fromJson(movies[index]);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondScreen(movie:movie)));
                          },
                          child: Card(
                            elevation: 10.0,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child:Container(
                                  width: double.infinity,
                                  child: Image.network('https://image.tmdb.org/t/p/w500${movie.posterUrl}',fit: BoxFit.fill,),
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('${movie.title}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.pink,fontSize: 16.0,fontWeight: FontWeight.bold),),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: movies.length ,
                  );
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.pink,
                      strokeWidth: 3.0,
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
