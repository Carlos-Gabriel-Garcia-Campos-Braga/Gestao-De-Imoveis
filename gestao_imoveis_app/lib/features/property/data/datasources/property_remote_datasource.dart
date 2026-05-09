import 'package:dio/dio.dart';
import 'package:gestao_imoveis/core/constants/api_constants.dart';
import 'package:gestao_imoveis/core/network/failure_mapper.dart';
import 'package:gestao_imoveis/features/property/data/models/create_property_request_model.dart';
import 'package:gestao_imoveis/features/property/data/models/inspection_report_model.dart';
import 'package:gestao_imoveis/features/property/data/models/property_model.dart';

class PropertyRemoteDataSource {
  const PropertyRemoteDataSource(this._dio);

  final Dio _dio;

  Future<List<PropertyModel>> getAll() async {
    try {
      final response =
          await _dio.get<List<dynamic>>(ApiConstants.properties);
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(PropertyModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<List<PropertyModel>> getByStatus(String status) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiConstants.propertyByStatus(status),
      );
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(PropertyModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<PropertyModel> getById(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiConstants.propertyById(id),
      );
      return PropertyModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<PropertyModel> create(CreatePropertyRequestModel req) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.properties,
        data: req.toJson(),
      );
      return PropertyModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<PropertyModel> update(
    int id, {
    required String description,
    required String type,
    required String zipCode,
    String? number,
    String? complement,
  }) async {
    try {
      final response = await _dio.put<Map<String, dynamic>>(
        ApiConstants.updateProperty(id),
        data: {
          'description': description,
          'type': type,
          'zipCode': zipCode,
          if (number != null) 'number': number,
          if (complement != null) 'complement': complement,
        },
      );
      return PropertyModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<PropertyModel> updateStatus(int id, String status) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        ApiConstants.updatePropertyStatus(id),
        data: {'status': status},
      );
      return PropertyModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<List<PropertyModel>> getArchived() async {
    try {
      final response =
          await _dio.get<List<dynamic>>(ApiConstants.archivedProperties);
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(PropertyModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<PropertyModel> archive(int id) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        ApiConstants.archiveProperty(id),
      );
      return PropertyModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<PropertyModel> unarchive(int id) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>(
        ApiConstants.unarchiveProperty(id),
      );
      return PropertyModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<List<InspectionReportModel>> getInspections(int id) async {
    try {
      final response = await _dio.get<List<dynamic>>(
        ApiConstants.propertyInspections(id),
      );
      return (response.data ?? [])
          .cast<Map<String, dynamic>>()
          .map(InspectionReportModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }

  Future<InspectionReportModel> addInspection(
    int id, {
    required String type,
    required String inspector,
    String? notes,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.propertyInspections(id),
        data: {
          'type': type,
          'inspector': inspector,
          if (notes != null) 'notes': notes,
        },
      );
      return InspectionReportModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw mapDioException(e);
    }
  }
}
