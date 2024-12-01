// Из коллекции sample_airbnb.listingsAndReviews найдите среднюю цену за сутки проживания на Гавайских островах.

db["airbnb"].aggregate([
  {
    $match: {
      $or: [
        {
          "address.location": {
            $geoWithin: {
              $geometry: {
                type: "Polygon",
                coordinates: [
                  [
                    [-156.32838300731004, 25.486050355725215],
                    [-148.41353044447607, 18.14911422341221],
                    [-162.83615067008463, 15.964629922482986],
                    [-164.243235570144, 25.009084026419178],
                    [-156.32838300731004, 25.486050355725215],
                  ],
                ],
              },
            },
          },
        },
        {
          "address.location": {
            $geoWithin: {
              $geometry: {
                type: "Polygon",
                coordinates: [
                  [
                    [-159.3581461797911, 23.443876387313534],
                    [-153.02626412952395, 19.35342070239473],
                    [-155.88440533276955, 17.64483995648542],
                    [-161.46877352988017, 21.90307431995957],
                    [-159.3581461797911, 23.443876387313534],
                  ],
                ],
              },
            },
          },
        },
      ],
    },
  },
  {
    $group: {
      _id: null,
      avgPricePerNight: { $avg: "$price" },
    },
  },
  {
    $project: {
      _id: 0,
      name: 1,
      avgPricePerNight: 1,
    },
  },
]);

// 2. Подсчитайте в коллекции sample_mflix.movies, сколько фильмов имеют imdb рейтинг выше 8 и выходили в период с 2015 до 2023 года (используем year) Какой из них имеет самый высокий рейтинг ?
db["movies"].countDocuments({
  "imdb.rating": { $gt: 8 },
  year: { $gte: 2015, $lte: 2023 },
});
db["movies"]
  .find(
    {
      "imdb.rating": { $gt: 8 },
      year: { $gte: 2015, $lte: 2023 },
    },
    { title: 1, "imdb.rating": 1, year: 1 }
  )
  .sort({ "imdb.rating": -1 })
  .limit(1);
