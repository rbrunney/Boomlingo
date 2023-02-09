package org.example;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

import java.util.Map;

public class Course_Delete implements RequestHandler<Map<String, String>, String> {
    @Override
    public String handleRequest(Map<String, String> input, Context context) {
        String title = input.get("Title");

        //Search DB for File

        return "Course: " + title + " deleted.";
    }
}
