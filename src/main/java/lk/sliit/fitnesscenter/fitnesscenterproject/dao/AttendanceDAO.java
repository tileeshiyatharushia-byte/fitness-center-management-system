package lk.sliit.fitnesscenter.fitnesscenterproject.dao;

import lk.sliit.fitnesscenter.fitnesscenterproject.model.Attendance;

import java.io.*;
import java.nio.file.*;
import java.time.*;
import java.time.format.*;
import java.util.*;
import java.util.concurrent.*;

public class AttendanceDAO {
    private static final String FILE_PATH = System.getProperty("user.home") + "/FitnessCenter/attendance.txt";
    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private static final Queue<Attendance> attendanceQueue = new ConcurrentLinkedQueue<>();

    // Create directory if it doesn't exist
    static {
        File file = new File(FILE_PATH);
        file.getParentFile().mkdirs();

        try {
            if (!file.exists()) {
                file.createNewFile();
            }
        } catch (IOException e) {
            System.err.println("Failed to initialize member storage: " + e.getMessage());
        }
    }

    // Insertion sort implementation
    private void insertionSort(List<Attendance> list) {
        for (int i = 1; i < list.size(); i++) {
            Attendance key = list.get(i);
            int j = i - 1;

            while (j >= 0 && list.get(j).getCheckInTime().isAfter(key.getCheckInTime())) {
                list.set(j + 1, list.get(j));
                j = j - 1;
            }
            list.set(j + 1, key);
        }
    }

    public void addAttendance(Attendance attendance) {
        attendanceQueue.add(attendance);
        processQueue();
    }

    private synchronized void processQueue() {
        try {
            Path path = Paths.get(FILE_PATH);
            if (!Files.exists(path)) {
                Files.createFile(path);
            }

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
                while (!attendanceQueue.isEmpty()) {
                    Attendance att = attendanceQueue.poll();
                    writer.write(att.toString() + "\n");
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Attendance> getAllAttendance() {
        List<Attendance> attendanceList = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            int recordId = 1;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 2) {
                    Attendance att = new Attendance();
                    att.setAttendanceId(recordId++);
                    att.setMemberId(Integer.parseInt(parts[0].trim()));
                    att.setCheckInTime(LocalDateTime.parse(parts[1].trim(), formatter));
                    if (parts.length > 2 && !parts[2].trim().isEmpty()) {
                        att.setCheckOutTime(LocalDateTime.parse(parts[2].trim(), formatter));
                    }
                    attendanceList.add(att);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        insertionSort(attendanceList);
        return attendanceList;
    }

    public List<Attendance> getAttendanceByMember(int memberId) {
        List<Attendance> all = getAllAttendance();
        List<Attendance> filtered = new ArrayList<>();
        for (Attendance a : all) {
            if (a.getMemberId() == memberId) {
                filtered.add(a);
            }
        }
        return filtered;
    }

    public List<Attendance> getAttendanceByDate(String date) {
        List<Attendance> all = getAllAttendance();
        List<Attendance> filtered = new ArrayList<>();
        for (Attendance a : all) {
            if (a.getFormattedCheckInTime().startsWith(date)) {
                filtered.add(a);
            }
        }
        return filtered;
    }

    public boolean updateCheckOut(int memberId) {
        List<Attendance> all = getAllAttendance();
        boolean updated = false;

        for (Attendance a : all) {
            if (a.getMemberId() == memberId && a.getCheckOutTime() == null) {
                a.setCheckOutTime(LocalDateTime.now());
                updated = true;
                break;
            }
        }

        if (updated) {
            return saveAllAttendance(all);
        }
        return false;
    }

    public boolean deleteAttendance(int attendanceId) {
        List<Attendance> all = getAllAttendance();
        boolean removed = all.removeIf(a -> a.getAttendanceId() == attendanceId);

        if (removed) {
            return saveAllAttendance(all);
        }
        return false;
    }

    private boolean saveAllAttendance(List<Attendance> attendanceList) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Attendance a : attendanceList) {
                writer.write(a.toString() + "\n");
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
