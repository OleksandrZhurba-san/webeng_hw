//Найдите средний возраст из коллекции ich.US_Adult_Income
db["US_Adult_Income"].aggregate([
  { $group: { _id: null, averageAge: { $avg: "$age" } } },
]);

//Поменяв подключение к базе данных, создать коллекцию orders_NAME (для уникальности - добавим ваше имя в название) со свойствами id, customer, product, amount, city, используя следующие данные:
//
//1 Olga Apple 15.55 Berlin
//
//2 Anna Apple 10.05 Madrid
//
//3 Olga Kiwi 9.6 Berlin
//
//4 Anton Apple 20 Roma
//
//5 Olga Banana 8 Madrid
//
//6 Petr Orange 18.3 Paris
db["orders"].insertMany([
  { id: 1, customer: "Olga", product: "Apple", amount: 15.55, city: "Berlin" },
  { id: 2, customer: "Anna", product: "Apple", amount: 10.05, city: "Madrid" },
  { id: 3, customer: "Olga", product: "Kiwi", amount: 9.6, city: "Berlin" },
  { id: 4, customer: "Anton", product: "Apple", amount: 20, city: "Roma" },
  { id: 5, customer: "Olga", product: "Banana", amount: 8, city: "Madrid" },
  { id: 6, customer: "Petr", product: "Orange", amount: 18.3, city: "Paris" },
]);

//Найти сколько всего было совершено покупок
db["orders"].countDocuments({});

//Найти сколько всего раз были куплены яблоки
db["orders"].countDocuments({ product: "Apple" });

//Вывести идентификаторы трех самые дорогих покупок
db["orders"].find({}, { id: 1 }).sort({ amount: -1 }).limit(3);
//Найти сколько всего покупок было совершено в Берлине
db["orders"].countDocuments({ city: "Berlin" });
//Найти количество покупок яблок в городах Берлин и Мадрид
db["orders"].countDocuments({ city: { $in: ["Berlin", "Madrid"] } });

//Найти сколько было потрачено каждым покупателем
db["orders"].aggregate([
  {
    $group: {
      _id: "$customer",
      totalAmount: { $sum: "$amount" },
    },
  },
]);
//(подсказка: используем $group и total: {$sum: '$amount'} )

//Найти в каких городах совершала покупки Ольга
db["orders"].aggregate([
  {
    $match: { customer: "Olga" },
  },
  {
    $group: {
      _id: "$city",
    },
  },
]);
//(подсказка: используем $match customer: 'Olga' и $group _id: '$city')
