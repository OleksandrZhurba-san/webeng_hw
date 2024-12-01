db["airbnb"].aggregate([{$match: {"address.market": "Barcelona"}}, {$bucket: {
  groupBy: "$price",
  boundaries: [0,50,100,100],
  default: "expensive",
  output: {
    count: {$sum: 1}
  }
}
}
]
)
