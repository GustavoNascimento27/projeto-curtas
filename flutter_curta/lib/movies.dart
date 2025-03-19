class Movies {
  late String link;
  late String idImdb;
  late String title;
  late String artista;
  late String createdAt;
  late int year;
  late String duration;
  late String description;
  late double rating;
  late String ratingCount;
  late String originalTitle;
  late String director;



  Movies()
  {
    link = "";

    idImdb = "";

    year = 0;

    title= "";

    rating= 0;

    createdAt = "";

    ratingCount= "";


    originalTitle= "";

    duration= "";

    director= "";

    description= "";

   
  }
  Movies.v(this.link,this.idImdb,this.title, this.artista, this.year, this.duration,this.director,this.ratingCount, this.originalTitle, this.rating);


  
  Movies.fromJson(Map<String, dynamic> json);
}