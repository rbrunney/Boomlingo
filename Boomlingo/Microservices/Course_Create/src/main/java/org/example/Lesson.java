package org.example;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Lesson {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String title = "New Lesson";

    private String question = "Questions";
    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }
}
