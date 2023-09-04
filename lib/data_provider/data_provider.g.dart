// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingData _$BookingDataFromJson(Map<String, dynamic> json) => BookingData(
      id: json['id'] as int?,
      hotel_name: json['hotel_name'] as String? ?? 'Загрузка...',
      hotel_adress: json['hotel_adress'] as String? ?? 'Загрузка...',
      horating: json['horating'] as int? ?? 0,
      rating_name: json['rating_name'] as String? ?? 'Загрузка...',
      departure: json['departure'] as String? ?? 'Загрузка...',
      arrival_country: json['arrival_country'] as String? ?? 'Загрузка...',
      tour_date_start: json['tour_date_start'] as String? ?? 'Загрузка...',
      tour_date_stop: json['tour_date_stop'] as String? ?? 'Загрузка...',
      number_of_nights: json['number_of_nights'] as int? ?? 0,
      room: json['room'] as String? ?? 'Загрузка...',
      nutrition: json['nutrition'] as String? ?? 'Загрузка...',
      tour_price: json['tour_price'] as int? ?? 0,
      fuel_price: json['fuel_price'] as int? ?? 0,
      service_charge: json['service_charge'] as int? ?? 0,
    );

Map<String, dynamic> _$BookingDataToJson(BookingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_name': instance.hotel_name,
      'hotel_adress': instance.hotel_adress,
      'horating': instance.horating,
      'rating_name': instance.rating_name,
      'departure': instance.departure,
      'arrival_country': instance.arrival_country,
      'tour_date_start': instance.tour_date_start,
      'tour_date_stop': instance.tour_date_stop,
      'number_of_nights': instance.number_of_nights,
      'room': instance.room,
      'nutrition': instance.nutrition,
      'tour_price': instance.tour_price,
      'fuel_price': instance.fuel_price,
      'service_charge': instance.service_charge,
    };

RoomsData _$RoomsDataFromJson(Map<String, dynamic> json) => RoomsData(
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => OneRoomData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomsDataToJson(RoomsData instance) => <String, dynamic>{
      'rooms': instance.rooms,
    };

OneRoomData _$OneRoomDataFromJson(Map<String, dynamic> json) => OneRoomData(
      id: json['id'] as int?,
      name: json['name'] as String? ?? 'Загрузка...',
      price: json['price'] as int? ?? 0,
      price_per: json['price_per'] as String? ?? 'Загрузка...',
      peculiarities: (json['peculiarities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image_urls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$OneRoomDataToJson(OneRoomData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'price_per': instance.price_per,
      'peculiarities': instance.peculiarities,
      'image_urls': instance.image_urls,
    };

AboutTheHotel _$AboutTheHotelFromJson(Map<String, dynamic> json) =>
    AboutTheHotel(
      description: json['description'] as String? ?? 'Загрузка...',
      peculiarities: (json['peculiarities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AboutTheHotelToJson(AboutTheHotel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };

HotelData _$HotelDataFromJson(Map<String, dynamic> json) => HotelData(
      id: json['id'] as int?,
      name: json['name'] as String? ?? 'Загрузка...',
      adress: json['adress'] as String? ?? 'Загрузка...',
      minimal_price: json['minimal_price'] as int? ?? 0,
      price_for_it: json['price_for_it'] as String? ?? 'Загрузка...',
      rating: json['rating'] as int? ?? 0,
      rating_name: json['rating_name'] as String? ?? 'Загрузка...',
      image_urls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      about_the_hotel: json['about_the_hotel'] == null
          ? const AboutTheHotel()
          : AboutTheHotel.fromJson(
              json['about_the_hotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelDataToJson(HotelData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adress': instance.adress,
      'minimal_price': instance.minimal_price,
      'price_for_it': instance.price_for_it,
      'rating': instance.rating,
      'rating_name': instance.rating_name,
      'image_urls': instance.image_urls,
      'about_the_hotel': instance.about_the_hotel,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://run.mocky.io/v3/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HotelData> getHotelData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<HotelData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/35e0d18e-2521-4f1b-a575-f0fe366f66e3',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HotelData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RoomsData> getRoomsData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RoomsData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/f9a38183-6f95-43aa-853a-9c83cbb05ecd',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RoomsData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookingData> getBookingData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BookingData>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/e8868481-743f-4eb2-a0d7-2bc4012275c8',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BookingData.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
