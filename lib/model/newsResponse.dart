import 'Source.dart';

class NewsResponse {
  NewsResponse({
    this.status,
    this.totalResults,
    this.newsList,
  });

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    code = json['code'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      newsList = [];
      json['articles'].forEach((v) {
        newsList?.add(News.fromJson(v));
      });
    }
  }

  String? status;
  num? totalResults;
  String? message;
  String? code;
  List<News>? newsList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;

    map['totalResults'] = totalResults;
    if (newsList != null) {
      map['articles'] = newsList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : null
/// title : "'I used my drone to find 1,400 lost dogs'"
/// description : "Phil James runs the dog search and rescue charity Drone to Home."
/// url : "https://www.bbc.co.uk/news/av/uk-england-leicestershire-64792401"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/1440F/production/_128795928_p0f5qkh4.jpg"
/// publishedAt : "2023-03-04T10:35:57Z"
/// content : "A man has used his drone to track down almost 1,400 lost dogs and return them to their owners.\r\nPhil James, from Woodthorpe in Nottinghamshire, runs the dog search and rescue charity Drone to Home.\r\n… [+366 chars]"
class News {
  News({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Source? source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
