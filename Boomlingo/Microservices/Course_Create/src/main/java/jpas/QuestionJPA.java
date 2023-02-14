package jpas;

import objects.Question;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestionJPA extends JpaRepository<Question, Integer> {
}
