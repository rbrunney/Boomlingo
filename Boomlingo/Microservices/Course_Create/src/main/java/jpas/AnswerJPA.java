package jpas;

import objects.Answer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AnswerJPA extends JpaRepository<Answer, Integer> {
}
