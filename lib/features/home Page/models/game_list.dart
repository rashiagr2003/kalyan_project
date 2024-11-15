import 'dart:convert';

class ScheduleModel {
  final String id;
  final String name;
  final String chartUrl;
  final bool play;
  final bool open;
  final bool marketOpen;
  final String openTime;
  final String closeTime;
  final int sortcol;
  final String result;

  ScheduleModel({
    required this.id,
    required this.name,
    required this.chartUrl,
    required this.play,
    required this.open,
    required this.marketOpen,
    required this.openTime,
    required this.closeTime,
    required this.sortcol,
    required this.result,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'] ?? '', // Default to empty string if null
      name: json['name'] ?? '', // Default to empty string if null
      chartUrl: json['chart_url'] ?? '', // Default to empty string if null
      play: json['play'] ?? false, // Default to false if null
      open: json['open'] ?? false, // Default to false if null
      marketOpen: json['market_open'] ?? false, // Default to false if null
      openTime: json['open_time'] ?? '', // Default to empty string if null
      closeTime: json['close_time'] ?? '', // Default to empty string if null
      sortcol: json['sortcol'] ?? 0, // Default to 0 if null
      result: json['result'] ?? '', // Default to empty string if null
    );
  }

  // Optionally, you can add a toJson method to serialize this object back into a map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'chart_url': chartUrl,
      'play': play,
      'open': open,
      'market_open': marketOpen,
      'open_time': openTime,
      'close_time': closeTime,
      'sortcol': sortcol,
      'result': result,
    };
  }
}

// Example function to parse a JSON response into a list of ScheduleModel
List<ScheduleModel> parseSchedules(String responseBody) {
  final parsed = jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed
      .map<ScheduleModel>((json) => ScheduleModel.fromJson(json))
      .toList();
}
