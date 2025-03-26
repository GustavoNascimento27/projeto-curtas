import 'package:flutter/material.dart';
import 'package:flutter_curta/movies.dart';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp( const MaterialApp (title: "App",
      home: MainApp(),));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});


  @override
  MainAPP createState() => MainAPP();
}

class MainAPP extends State<MainApp> {
 // ignore: unused_field
bool mostrarMovies = false;
List<Movies> movies=List.empty();                                      
Movies moviesorteada  = Movies();
int total = 0;
 Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/movies.json');
     Iterable data = await json.decode(response);
    movies =  List<Movies>.from(data.map((model)=> Movies.fromJson(model)));
    total = movies.length;
    setState(() {
      movies;
      total;
    });
  }




sorteiaMovies()
{
  var r = Random();
  var index = r.nextInt(movies.length);
   moviesorteada =  movies[index];
   mostrarMovies = true;
  setState(() {
   moviesorteada;
   mostrarMovies;}
  );

}


  @override
   initState()  {
    super.initState();
       readJson();
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body:  Center(
          child:Padding(padding:const EdgeInsets.fromLTRB(25, 30, 25 , 30) ,
          child:Column(mainAxisSize: MainAxisSize.max,
           //Alinha no centro da página - vertical - , 
           //com distribuição uniforme
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:<Widget>[ 
             Text('Sorteie uma das $total Movies!', style: const TextStyle(color: Color.fromRGBO(73, 36, 62, 1), fontSize: 40, fontStyle: FontStyle.italic),),
            
            
            ElevatedButton(onPressed:sorteiaMovies,style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(187,132 , 147, 1),fixedSize: const Size(250, 75)), child: const Text("Sorteio!!!",style: TextStyle(color: Color.fromRGBO(73, 36, 62, 1),fontSize:30,fontWeight: FontWeight.bold),),),
           Visibility(
  visible: mostrarMovies,
  child:Expanded(child: Column( 
  
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,mainAxisSize: MainAxisSize.max,
    children: <Widget>[
            Text(moviesorteada.link,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:30, 
                                  fontWeight: FontWeight.w600),),
            Text(moviesorteada.idImdb,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w500),),
            Text(moviesorteada.title,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w500),),
            Text(moviesorteada.director,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w400),),
            Text(moviesorteada.createdAt,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w400),),
          
           ])))

        ]
          )),
      ),
    ));
  }
}