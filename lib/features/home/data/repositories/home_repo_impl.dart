import 'package:dio/dio.dart';
import 'package:lavender/core/networking/api_constants.dart';
import 'package:lavender/core/networking/dio_helper.dart';
import 'package:lavender/features/home/data/models/specialists_response.dart';
import '../../logic/repositories_interface/home_repo.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<SpecialistsResponse> getSpecialists() async {
    try {
      final response = await DioHelper.getData(
        url: ApiConstants.getSpecialists,
      );

      return SpecialistsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("Network error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
