package jpas;

import objects.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseJPA extends JpaRepository<Course, Integer> {
}
