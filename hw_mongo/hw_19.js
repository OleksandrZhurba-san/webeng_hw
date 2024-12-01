// Найдите трек с наивысшими показателями  Danceability и Energy.
db["Spotify_Youtube"].aggregate([
  {
    $sort: {
      energy: -1,
      danceability: -1,
    },
  },
  {
    $limit: 1,
  },
  {
    $project: {
      _id: 0,
      Artist: 1,
      Track: 1,
    },
  },
]);

// У какого трека (но не compilation) самая большая длительность?
db["Spotify_Youtube"]
  .find(
    { Album_type: { $ne: "compilation" } },
    { _id: 0, Title: 1, Duration_ms: 1 }
  )
  .sort({ Duration_ms: -1 })
  .limit(1);
// В каком одном альбоме самое большее количество треков?
db["Spotify_Youtube"].aggregate([
  {
    $group: {
      _id: "$Album",
      recordCount: { $sum: 1 },
    },
  },
  {
    $sort: {
      recordCount: -1,
    },
  },
  {
    $limit: 1,
  },
]);
// Сколько просмотров видео на youtube у трека с самым высоким количеством прослушиваний на spotify (Stream)?
db["Spotify_Youtube"].aggregate([
  { $sort: { Stream: -1 } },
  { $project: { _id: 0, Artist: 1, Track: 1, Stream: 1, Views: 1 } },
  { $limit: 1 },
]);
// Экспортируйте 20 самых популярных (прослушивания или просмотры) треков по версиям youtube и spotify и импортируйте в базу ich_edit их с именами top20youtube и top20spotify, и добавьте им свои имена для уникальности.
db["Spotify_Youtube"].aggregate([
  { $sort: { Views: -1 } },
  { $limit: 20 },
  { $out: "top20youtube_Zhurba" },
]);
