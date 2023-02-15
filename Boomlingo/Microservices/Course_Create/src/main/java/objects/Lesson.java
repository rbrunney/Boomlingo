package objects;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Lesson")
public class Lesson {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String title;
    @ManyToOne
    Course course;
    @OneToMany
    @JoinColumn(name = "Question_Id")
    Set<Question> question;
    public void setId(int id) {
        this.id = id;
    }
    
    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
