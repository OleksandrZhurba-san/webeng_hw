//Найти все кинотеатры в Калифорнии и посчитать их количество
db["theaters"].countDocuments({ "location.address.state": "CA" });

//Найти недвижимость с самым большим количеством спален (bedrooms) и напишите ее название
db["airbnb"].find({}, { name: 1, bedrooms: 1 }).sort({ bedrooms: -1 }).limit(1);

//Найти недвижимость с самым высоким рейтингом  review_scores_rating при минимальном количестве отзывов 50 (number_of_reviews) и напишите ее название
db["airbnb"].aggregate([
  {
    $match: {
      $expr: { $gte: [{ $size: "$reviews" }, 50] },
    },
  },
  {
    $sort: {
      review_scores_rating: -1,
    },
  },
  {
    $limit: 1,
  },
  {
    $project: {
      _id: 0,
      name: 1,
      "review_scores.review_scores_rating": 1,
    },
  },
]);
