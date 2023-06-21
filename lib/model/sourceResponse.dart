import 'Source.dart';

class SourcesResponse {
  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  SourcesResponse({this.status, this.sources, this.code, this.message});

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }

  SourcesResponse copyWith({
    String? status,
    List<Source>? sources,
  }) =>
      SourcesResponse(
        status: status ?? this.status,
        sources: sources ?? this.sources,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
