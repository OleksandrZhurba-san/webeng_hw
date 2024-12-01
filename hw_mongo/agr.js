db["shipwrecks"].aggregate([
  { $match: { "address.market": "Barcelona" } },
  {
    $bucket: {
      groupBy: "$price",
      boundaries: [0, 50, 100, 1000],
      default: "expensive",
      output: {
        count: { $sum: 1 },
        propertyName: { $push: "$name" },
      },
    },
  },
]);
const bucket = {
  groupBy: "$price",
  boundaries: [0, 50, 100, 1000],
  default: "EXPENSIVE",
  output: {
    count: { $sum: 1 },
    propertyName: { $push: "$name" },
  },
};

db["airbnb"].aggregate([]);
db["restaurants"].aggregate([
  { $match: { grades: { $ne: [] } } },

  { $unwind: "$grades" },

  { $sort: { "grades.score": -1 } },
  {
    $group: {
      _id: "$_id",
      name: { $first: "$name" },
      cuisine: { $first: "$cuisine" },
      grades: { $push: "$grades" },
    },
  },
]);

db.restaurants.aggregate([
  {
    $group: {
      _id: 0,
      avgRating: { $avg: { $avg: "$grades.score" } }, // среднюю оценку
    },
  },
  {
    $bucket: {
      groupBy: "$avgRating", // поле, группировки
      boundaries: [0, 20, 40, 60, 80, 100], // границы
      default: "Other",
      output: {
        count: { $sum: 1 }, // количество ресторанов в каждом диапазоне
        avgRating: { $avg: "$avgRating" }, // средняя оценка в каждом диапазоне
      },
    },
  },
]);
