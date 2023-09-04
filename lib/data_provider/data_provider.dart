import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';

// hotel page data: https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3
// room page data: https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd
// booking page data: https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8

part 'data_provider.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/35e0d18e-2521-4f1b-a575-f0fe366f66e3')
  Future<HotelData> getHotelData();

  @GET('/f9a38183-6f95-43aa-853a-9c83cbb05ecd')
  Future<RoomsData> getRoomsData();

  @GET('/e8868481-743f-4eb2-a0d7-2bc4012275c8')
  Future<BookingData> getBookingData();
}

@JsonSerializable()
class BookingData {
  int? id;
  String hotel_name;
  String hotel_adress;
  int horating;
  String rating_name;
  String departure;
  String arrival_country;
  String tour_date_start;
  String tour_date_stop;
  int number_of_nights;
  String room;
  String nutrition;
  int tour_price;
  int fuel_price;
  int service_charge;

  BookingData({
    this.id,
    this.hotel_name = 'Загрузка...',
    this.hotel_adress = 'Загрузка...',
    this.horating = 0,
    this.rating_name = 'Загрузка...',
    this.departure = 'Загрузка...',
    this.arrival_country = 'Загрузка...',
    this.tour_date_start = 'Загрузка...',
    this.tour_date_stop = 'Загрузка...',
    this.number_of_nights = 0,
    this.room = 'Загрузка...',
    this.nutrition = 'Загрузка...',
    this.tour_price = 0,
    this.fuel_price = 0,
    this.service_charge = 0,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) =>
      _$BookingDataFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDataToJson(this);
}

@JsonSerializable()
class RoomsData {
  RoomsData({List<OneRoomData>? rooms}) {
    this.rooms = rooms ?? [OneRoomData()];
  }
  late List<OneRoomData> rooms;

  factory RoomsData.fromJson(Map<String, dynamic> json) =>
      _$RoomsDataFromJson(json);
  Map<String, dynamic> toJson() => _$RoomsDataToJson(this);
}

@JsonSerializable()
class OneRoomData {
  int? id;
  String name;
  int price;
  String price_per;
  final List<String>? peculiarities;
  List<String>? image_urls;

  OneRoomData({
    this.id,
    this.name = 'Загрузка...',
    this.price = 0,
    this.price_per = 'Загрузка...',
    this.peculiarities,
    this.image_urls,
  });

  factory OneRoomData.fromJson(Map<String, dynamic> json) =>
      _$OneRoomDataFromJson(json);
  Map<String, dynamic> toJson() => _$OneRoomDataToJson(this);
}

@JsonSerializable()
class AboutTheHotel {
  final String description;
  final List<String>? peculiarities;

  const AboutTheHotel({
    this.description = 'Загрузка...',
    this.peculiarities,
  });

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) =>
      _$AboutTheHotelFromJson(json);
  Map<String, dynamic> toJson() => _$AboutTheHotelToJson(this);
}

@JsonSerializable()
class HotelData {
  int? id;
  String name;
  String adress;
  int minimal_price;
  String price_for_it;
  int rating;
  String rating_name;
  List<String>? image_urls;
  AboutTheHotel about_the_hotel;

  HotelData({
    this.id,
    this.name = 'Загрузка...',
    this.adress = 'Загрузка...',
    this.minimal_price = 0,
    this.price_for_it = 'Загрузка...',
    this.rating = 0,
    this.rating_name = 'Загрузка...',
    this.image_urls,
    this.about_the_hotel = const AboutTheHotel(),
  });

  factory HotelData.fromJson(Map<String, dynamic> json) =>
      _$HotelDataFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDataToJson(this);
}

class DataProvider {
  Future<HotelData> getHotelData() async {
    HotelData data = HotelData();
    try {
      final dio = Dio(
        BaseOptions(
          connectTimeout: Duration(milliseconds: 50000),
          receiveTimeout: Duration(milliseconds: 50000),
          contentType: 'application/json',
        ),
      );
      print(dio.options.baseUrl);
      final client = RestClient(dio);
      data = await client.getHotelData();
      print(data);
    } catch (e) {
      print('EXCEPTION!!! $e');
    }
    return data;
  }

  Future<RoomsData> getRoomsData() async {
    RoomsData data = RoomsData();
    try {
      final dio = Dio(
        BaseOptions(
          connectTimeout: Duration(milliseconds: 50000),
          receiveTimeout: Duration(milliseconds: 50000),
          contentType: 'application/json',
        ),
      );
      print(dio.options.baseUrl);
      final client = RestClient(dio);
      data = await client.getRoomsData();
      print(data);
    } catch (e) {
      print('EXCEPTION!!! $e');
    }
    return data;
  }

  Future<BookingData> getBookingData() async {
    BookingData data = BookingData();
    try {
      final dio = Dio(
        BaseOptions(
          connectTimeout: Duration(milliseconds: 50000),
          receiveTimeout: Duration(milliseconds: 50000),
          contentType: 'application/json',
        ),
      );
      print(dio.options.baseUrl);
      final client = RestClient(dio);
      data = await client.getBookingData();
      print(data);
    } catch (e) {
      print('EXCEPTION!!! $e');
    }
    return data;
  }
}
