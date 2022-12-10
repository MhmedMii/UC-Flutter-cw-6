< main >
import 'package:flutter/material.dart';
import 'package:pages_nav/pages/homepage.dart';
import 'package:pages_nav/pages/MoviesDetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

-------------------------------------------
< Model movies >
import 'package:flutter/material.dart';

class Movie {
  String name;
  String image;
  String describe;

  Movie({required this.name, required this.image, required this.describe});

  static List<Movie> movie = [
    Movie(
        name: "Abraj El Kuwait ",
        image:
            "https://user-images.githubusercontent.com/24327781/188260105-52be6a2e-a6d3-4ceb-86c0-ddc83e0aa5b6.jpeg",
        describe: "A Kuwait Tower Located in Salmiya infront of the sea"),
    Movie(
        name: "Tahreer",
        image:
            "https://user-images.githubusercontent.com/24327781/188260123-28de85b4-d272-4ebb-b2ad-22a9582079bf.jpeg",
        describe:
            "Is a Tower Located in Kuwait City for Government's reviews "),
    Movie(
      name: "Masjed EL Kabeer",
      image:
          "https://user-images.githubusercontent.com/24327781/188260137-021d865a-625e-4941-ad75-6427c690e0cf.jpeg",
      describe:
          "Is A Mosque Located in Kuwait City, It is the biggest mosque in Kuwait",
    ),
  ];
}
-------------------------------------------
< MoviesDetails >
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pages_nav/models/movies.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              movie.image,
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ),
            Text(
              movie.name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Describtion : ${movie.describe}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
-------------------------------------------

< homepage >
import 'MoviesDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pages_nav/models/movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kuwait City",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: Movie.movie.length,
        itemBuilder: ((context, index) {
          return Container(
            height: 200,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return MovieDetails(movie: Movie.movie[index]);
                    }),
                  ),
                );
              },
              child: Card(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Image.network(
                          Movie.movie[index].image,
                          width: 200,
                          height: 200,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          Movie.movie[index].name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
