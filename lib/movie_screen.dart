// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'movie_model.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen({
    Key? key,
  required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body:Stack(
        children: [
          ..._buildBackground(context,movie),
          _buildMovieInformation(context),
          _buildActions(context),
        ],
      ),
    );
  }

  Positioned _buildActions(BuildContext context) {
    return Positioned(
          bottom: 50,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                fixedSize: Size(MediaQuery.of(context).size.width*0.425,50),
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )
                ),  
                
              onPressed: () {
              
              }, 
              child: RichText(text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                children: [
                  TextSpan(
                    text: 'Add to',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.bold,),
                  ),
                  const TextSpan(
                    text: ' Watchlist',
                  )
                ]
              ))),
              const SizedBox(width: 10,),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                fixedSize: Size(MediaQuery.of(context).size.width*0.425,50),
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )
                ),  
                
              onPressed: () {
                Navigator.pushReplacement (context,
                MaterialPageRoute(builder:((context) => _MoviePlayer(movie: movie)))
                );
              }, 
              child: RichText(text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                children: [
                  TextSpan(
                    text: 'Start',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white,fontWeight: FontWeight.bold,),
                  ),
                  const TextSpan(
                    text: ' Watching',
                  )
                ]
              )),
              ),
            ],),
          ));
  }

  Positioned _buildMovieInformation(BuildContext context) {
    return Positioned(
          bottom: 150,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                          movie.name,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${movie.year} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            unratedColor: Colors.white,
                            itemSize: 20,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(height: 20,),
                          Text(
                            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur? [33] At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.',
                            maxLines: 8,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(height:1.75,color:Colors.white),
                          )
              ],
            ),
          ),
        );
  }

  List<Widget> _buildBackground(context,movie) {
    return [Container(
          height: double.infinity,
          color: const Color(0xFF0000B49),
        ),
        Image.asset(
            movie.imagepath,
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.5,
            fit: BoxFit.cover,
          ),
          Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    // ignore: prefer_const_literals_to_create_immutables
                    colors:[
                      Colors.transparent,
                      Color(0xFF0000B49),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.3,0.5]
                    )
                )
                )
              ),];
  }
}

class _MoviePlayer extends StatefulWidget {
  const _MoviePlayer({
    Key? key,
  required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<_MoviePlayer> createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<_MoviePlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState(){
    super.initState();

    videoPlayerController=VideoPlayerController.asset(widget.movie.videopath)..initialize().then((value){setState(() {});});

    chewieController=ChewieController(videoPlayerController: videoPlayerController);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:SafeArea(child: Chewie(controller: chewieController),)
    );
  }
}