package objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Question {
    @Id
    private int id;
    private String question;
    private String correct_answer;


    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
}
