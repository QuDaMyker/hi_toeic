import 'dart:convert';

import 'package:flutter/foundation.dart';

class RemoteConfigModel {
  Map<String, dynamic>? data;
  RemoteConfigModel({
    this.data,
  });

  RemoteConfigModel copyWith({
    Map<String, dynamic>? data,
  }) {
    return RemoteConfigModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory RemoteConfigModel.fromMap(Map<String, dynamic> map) {
    return RemoteConfigModel(
      data: map['data'] != null
          ? Map<String, dynamic>.from((map['data'] as Map<String, dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RemoteConfigModel.fromJson(String source) =>
      RemoteConfigModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RemoteConfigModel(data: $data)';

  @override
  bool operator ==(covariant RemoteConfigModel other) {
    if (identical(this, other)) return true;

    return mapEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
