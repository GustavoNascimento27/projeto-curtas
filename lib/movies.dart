
class Movies {
  late String link;
  late String idImdb;
  late String title;
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
  Movies.v(this.link,this.idImdb,this.title, this.year, this.duration,this.director,this.ratingCount, this.originalTitle, this.rating);


  
  Movies.fromJson(Map<String, dynamic> json):
        link = json['link'] as String,
        title = json['title'] as String,
        idImdb= json['idImdb'] as String,
        year= json['year'] as int,
        description= json['description'] as String,
        director = json['director'] as String,
        rating = json['rating'] as double,
        ratingCount = json['ratingCount'] as String,
        originalTitle=json['originalTitle'] as String,   
        duration = json['Duration'] as String;   

        
  Map<String, dynamic> toJson() => {
        'link': link,
        'idImdb':  idImdb,
        'title':  title,
        'year':  year,
        'description':  description,
        'director':director,
        'rating': rating,
        'ratingCount':ratingCount,
        'originalTitle':  originalTitle,
        'duration': duration,
        
      };
}

