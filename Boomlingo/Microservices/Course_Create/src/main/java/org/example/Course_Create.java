package org.example;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Course_Create implements RequestHandler<Map<String, String>, String> {
    @Override
    public String handleRequest(Map<String, String> input, Context context) {
        //Lessons are in a comma separated string
        String title = input.get("Title");
        ArrayList<String> lessonIds = new ArrayList<String>();
        String lessons = input.get("Lessons");
        String[] lessonsToSplit = lessons.split(",");
        for (String lesson:lessonsToSplit) {
            lessonIds.add(lesson);
        }
        //write object to DB

        return "Course: " + title + " added.";
    }
}
