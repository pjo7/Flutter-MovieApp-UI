class Movie{
  final String name;
  final String imagepath;
  final String videopath;
  final String category;
  final int year;
  final Duration duration;

  const Movie({
    required this.name,
    required this.imagepath,
    required this.videopath,
    required this.category,
    required this.duration,
    required this.year,
  });

  static const List<Movie> movies=[
      Movie(
      name: '3 Idiots', 
      imagepath: 'assests/images/movie1.jpg', 
      videopath: 'assests/video/RickAstley.mp4', 
      category: 'Comedy · Drama', 
      duration:Duration(hours: 2,minutes: 43), 
      year: 2009,
      ),
       Movie(
      name: 'Banglore Days', 
      imagepath: 'assests/images/movie3.jpg', 
      videopath: 'assests/video/RickAstley.mp4', 
      category: 'Comedy · Drama · Romance', 
      duration:Duration(hours: 2,minutes: 51), 
      year: 2014,
      ),
      Movie(
      name: 'Taare Zameen Par', 
      imagepath: 'assests/images/movie2.jpg', 
      videopath: 'assests/video/RickAstley.mp4', 
      category: 'Drama · Family', 
      duration:Duration(hours: 2,minutes: 42), 
      year: 2007,
      ),
      Movie(
      name: 'Om Shanti Oshana', 
      imagepath: 'assests/images/movie4.jpg', 
      videopath: 'assests/video/RickAstley.mp4', 
      category: 'Comedy · Romance', 
      duration:Duration(hours: 2,minutes: 4), 
      year: 2014,
      ),
  ];

}