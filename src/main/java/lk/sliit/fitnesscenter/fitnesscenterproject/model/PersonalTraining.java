package lk.sliit.fitnesscenter.fitnesscenterproject.model;

import java.time.LocalDateTime;

public class PersonalTraining extends FitnessClass {
    private String focusArea;

    public PersonalTraining() {
        super();
    }

    public PersonalTraining(String classId, String className, LocalDateTime dateTime, int duration,
                            String trainerId, int maxParticipants, String description, String focusArea) {
        super(classId, className, dateTime, duration, trainerId, maxParticipants, description);
        this.focusArea = focusArea;
    }


    public String getFocusArea() {
        return focusArea;
    }

    public void setFocusArea(String focusArea) {
        this.focusArea = focusArea;
    }
}

