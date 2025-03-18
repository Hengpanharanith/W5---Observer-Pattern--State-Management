
import '../models/course.dart';
import 'courses_repo.dart';

class CoursesMockRepository extends CoursesRepository {
  @override
  List<Course> getCourses() {
    print('Repository - get course');
    return [Course(name: 'Flutter'), Course(name: 'JAVA')];
  }

  @override
  void addScore(Course course, CourseScore score) {
    print('Repository - add  score');
    course.addScore(score); // For test
  }
}
