package lk.sliit.fitnesscenter.fitnesscenterproject.model;

import java.time.LocalDateTime;

public class GroupClass extends FitnessClass {
    private String groupType;

    public GroupClass() {
        super();
    }

    public GroupClass(String classId, String className, LocalDateTime dateTime, int duration,
                      String trainerId, int maxParticipants, String description, String groupType) {
        super(classId, className, dateTime, duration, trainerId, maxParticipants, description);
        this.groupType = groupType;
    }



    public String getGroupType() {
        return groupType;
    }

    public void setGroupType(String groupType) {
        this.groupType = groupType;
    }
}