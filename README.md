# MoviesDatabase

Consider three models: 
```
1) Actor [first name, last name]
2) Movie [name, revenue]
3) Genre [name]
```
Tasks:
 - think about relationships between each od the models (do not overcomplicate it, lets assume that film has one genre).
 - create CRUD for those 3 models -> addidtional information on index page:
  * Actors - 3 movies they played in
  * Movie - genre
  * Genre - amout of films from this genre
 Sorting / filtering -> [help here](https://github.com/activerecord-hackery/ransack)
 - Stats page:
  * Most active actor: [one who plays in highest number of films]
  * Movie which generates the biggest revenue: xx 
  * Most popular genre: xx
  
Consider testing your solutions :)
