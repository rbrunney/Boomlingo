package objects;
import javax.persistence.*;

@Entity
@Table(name = "Question")
public class Question {
    @Id
    private int id;
    private String question;
    @OneToOne
    Answer correct_answer;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
}
