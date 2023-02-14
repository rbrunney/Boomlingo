package jpas;

import objects.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LessonJPA extends JpaRepository<Lesson, Integer> {
}
