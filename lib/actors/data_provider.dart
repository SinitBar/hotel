import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
// hotel page data: https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3

part 'data_provider.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/35e0d18e-2521-4f1b-a575-f0fe366f66e3')
  Future<HotelData> getData();
}

@JsonSerializable()
class AboutTheHotel {
  String? description;
  List<String>? peculiarities;

  AboutTheHotel({
    this.description,
    this.peculiarities,
  });
  factory AboutTheHotel.fromJson(Map<String, dynamic> json) =>
      _$AboutTheHotelFromJson(json);
  Map<String, dynamic> toJson() => _$AboutTheHotelToJson(this);
}

@JsonSerializable()
class HotelData {
  int? id;
  String? name;
  String? adress;
  int? minimal_price;
  String? price_for_it;
  int? rating;
  String? rating_name;
  List<String>? image_urls;
  AboutTheHotel? about_the_hotel;

  HotelData({
    this.id,
    this.name,
    this.adress,
    this.minimal_price,
    this.price_for_it,
    this.rating,
    this.rating_name,
    this.image_urls,
    this.about_the_hotel,
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
          // baseUrl:
          //     'https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3',
          connectTimeout: Duration(milliseconds: 50000),
          receiveTimeout: Duration(milliseconds: 50000),
          contentType: 'application/json',
        ),
      );
      print(dio.options.baseUrl);
      final client = RestClient(dio);
      data = await client.getData();
      print(data);
    } catch (e) {
      print('EXCEPTION!!! $e');
    }
    return data;
  }
}
