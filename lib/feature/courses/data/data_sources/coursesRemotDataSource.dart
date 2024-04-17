import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nurse_space/core/handlers/apiErrorHandler.dart';
import 'package:nurse_space/feature/search/data/models/search_result_model.dart';
import 'package:nurse_space/feature/courses/data/models/course/course.dart';
import 'package:nurse_space/feature/courses/data/models/lesson/lesson.dart';

import '../../../../core/constant/endPoints.dart';
import '../../../../core/managers/dio_manager.dart';
import '../../../categories/data/models/category/category.dart';

void main() async {
  CoursesRemoteDataSource().getCourses();
}

class CoursesRemoteDataSource {
  Future<List<Course>> getCourses([int? userId]) async {
    try {
      final endPoint = userId == null
          ? EndPoints.allCourses
          : "${EndPoints.users}/$userId/${EndPoints.courses}";
      final response = await DioManager.dio.get(endPoint);
      final jsonEncoded = json.encode(response.data);

      final jsonData = json.decode(jsonEncoded);
      final List<dynamic> dataObject = jsonData['data'];
      final List<Course> courses =
          dataObject.map((json) => Course.fromJson(json)).toList();
      print(courses[0].toJson());

      return courses;
    } on DioException catch (e) {
      ApiErrorHandler.validateErrors(e.response);
      rethrow;
    }
  }

  void postCourse() {
    DioManager.dio.post(EndPoints.allCourses, data: {
      "course_name": "CourseApp",
      "category_id": "1",
      "professor_id": 1
    });
  }

  Future<List<Lesson>> getAllLessons() async {
    final response = await DioManager.dio.get(EndPoints.lessons);
    final jsonEncoded = json.encode(response.data);

    final jsonData = json.decode(jsonEncoded);
    final List<dynamic> dataObject = jsonData['data'];
    final List<Lesson> lessons =
        dataObject.map((json) => Lesson.fromJson(json)).toList();

    return lessons;
  }

  Future<List<String>> checkout(int courseId) async {
    final response = await DioManager.dio.post(EndPoints.checkout,
        queryParameters: {"course_id": courseId.toString()});
    final redirectionUrl = response.data;

    print("REMOTEEEEEE");
    print(response.data);
    return redirectionUrl ?? [""];
  }

}
