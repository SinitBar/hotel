part of 'hotel_data_bloc.dart';

@immutable
abstract class HotelDataEvent {}

class HotelDataLoadEvent extends HotelDataEvent {}

// class HotelDataLoadEvent extends HotelDataEvent {
//   HotelDataLoadEvent() {
//     _load();
//   }
//
//   late final HotelData _hotelData;
//   HotelData get hotelData {
//     try {
//       return _hotelData;
//     } catch (e) {
//       print('CATCHED EXCEPTION!!! $e');
//       return HotelData();
//     }
//   }
//
//   _load() async {
//     _hotelData = await DataProvider().getHotelData();
//   }
// }
