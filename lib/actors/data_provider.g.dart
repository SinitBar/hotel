// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
  Future<HotelData> getData() async {
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
