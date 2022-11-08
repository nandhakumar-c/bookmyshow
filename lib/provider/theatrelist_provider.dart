import 'package:flutter/material.dart';

class TimeList {
  String? time;
  bool? isFilled;
  String? audioSystem = "";
  TimeList({this.time, this.isFilled, this.audioSystem});
}

class Theatre {
  String? theatreName;
  List<TimeList>? timeList;
  bool? isCancellationAvailable = false;
  Theatre({this.theatreName, this.timeList, this.isCancellationAvailable});
}

class TheatreList with ChangeNotifier {
  List<List<Theatre>> theatreList = [
    //list1
    [
      Theatre(
        theatreName: "SPI: The Cinema, Brookefields Mall",
        timeList: [
          TimeList(
              time: "03:30 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "03:50 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "07:00 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "07:10 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(
              time: "10:15 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "10:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
        ],
        isCancellationAvailable: false,
      ),
      Theatre(
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list2
    [
      Theatre(
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "SPI: The Cinema, Brookefields Mall",
        timeList: [
          TimeList(
              time: "03:30 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "03:50 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "07:00 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "07:10 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(
              time: "10:15 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "10:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list3
    [
      Theatre(
        theatreName: "SPI: The Cinema, Brookefields Mall",
        timeList: [
          TimeList(
              time: "03:30 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "03:50 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "07:00 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "07:10 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(
              time: "10:15 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "10:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list4
    [
      Theatre(
        theatreName: "SPI: The Cinema, Brookefields Mall",
        timeList: [
          TimeList(
              time: "03:30 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "03:50 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "07:00 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "07:10 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(
              time: "10:15 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "10:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list5
    [
      Theatre(
        theatreName: "SPI: The Cinema, Brookefields Mall",
        timeList: [
          TimeList(
              time: "03:30 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "03:50 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "07:00 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "07:10 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(
              time: "10:15 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "10:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list6
    [
      Theatre(
        theatreName: "SPI: The Cinema, Brookefields Mall",
        timeList: [
          TimeList(
              time: "03:30 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "03:50 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "07:00 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "07:10 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(
              time: "10:15 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "10:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ],
    //list7
    [
      Theatre(
        theatreName: "SPI: The Cinema, Brookefields Mall",
        timeList: [
          TimeList(
              time: "03:30 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "03:50 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(time: "07:00 PM", audioSystem: "DOLBY 7.1", isFilled: false),
          TimeList(time: "07:10 PM", audioSystem: "DOLBY 7.1", isFilled: true),
          TimeList(
              time: "10:15 PM", audioSystem: "ATMOS enabled", isFilled: true),
          TimeList(time: "10:30 PM", audioSystem: "DOLBY 7.1", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Murugan Cinemas A/C 4K Atmos: Thudiyalur",
        timeList: [
          TimeList(
              time: "06:30 PM", audioSystem: "DolbyAtmos", isFilled: false),
          TimeList(
              time: "10:00 PM", audioSystem: "DolbyAtmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
      Theatre(
        theatreName: "Karpagam Theatres 4K Dolby Atmos: Coimbatore",
        timeList: [
          TimeList(time: "06:45 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "07:15 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:20 PM", audioSystem: "Atmos", isFilled: false),
          TimeList(time: "10:45 PM", audioSystem: "Atmos", isFilled: false),
        ],
        isCancellationAvailable: true,
      ),
    ]
  ];
}
