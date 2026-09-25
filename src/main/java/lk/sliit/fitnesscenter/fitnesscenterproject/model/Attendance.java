package lk.sliit.fitnesscenter.fitnesscenterproject.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.Duration;

public class Attendance {
    private int attendanceId;
    private int memberId;
    private LocalDateTime checkInTime;
    private LocalDateTime checkOutTime;

    public Attendance() {}

    public Attendance(int memberId, LocalDateTime checkInTime) {
        this.memberId = memberId;
        this.checkInTime = checkInTime;
    }

    // Getters and Setters
    public int getAttendanceId() { return attendanceId; }
    public void setAttendanceId(int attendanceId) { this.attendanceId = attendanceId; }

    public int getMemberId() { return memberId; }
    public void setMemberId(int memberId) { this.memberId = memberId; }

    public LocalDateTime getCheckInTime() { return checkInTime; }
    public void setCheckInTime(LocalDateTime checkInTime) { this.checkInTime = checkInTime; }

    public LocalDateTime getCheckOutTime() { return checkOutTime; }
    public void setCheckOutTime(LocalDateTime checkOutTime) { this.checkOutTime = checkOutTime; }

    // Formatted time strings
    public String getFormattedCheckInTime() {
        return checkInTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    public String getFormattedCheckOutTime() {
        return checkOutTime != null ?
                checkOutTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) : "";
    }

    // Calculate duration
    public String getDuration() {
        if (checkOutTime == null) return "";
        Duration duration = Duration.between(checkInTime, checkOutTime);
        long hours = duration.toHours();
        long minutes = duration.minusHours(hours).toMinutes();
        return String.format("%d hrs %d mins", hours, minutes);
    }

    @Override
    public String toString() {
        return memberId + "," + getFormattedCheckInTime() + "," + getFormattedCheckOutTime();
    }
}