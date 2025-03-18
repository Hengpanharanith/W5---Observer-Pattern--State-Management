import 'package:your_project_name/W6-Asynchronous%20Calls%20&%20Networking/EX-1-START-CODE/models/course.dart';


abstract class CoursesRepository {
  List<Course> getCourses();

  void addScore(Course course, CourseScore score);
}
