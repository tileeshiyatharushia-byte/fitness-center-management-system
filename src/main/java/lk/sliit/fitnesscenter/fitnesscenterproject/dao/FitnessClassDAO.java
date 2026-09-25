package lk.sliit.fitnesscenter.fitnesscenterproject.dao;

import lk.sliit.fitnesscenter.fitnesscenterproject.model.FitnessClass;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.GroupClass;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.PersonalTraining;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class FitnessClassDAO {
    private static final String FILE_PATH = System.getProperty("user.home") + "/FitnessCenter/classes.txt";


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

    // Add a new class
    public boolean addClass(FitnessClass fitnessClass) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = String.format("%s,%s,%s,%d,%s,%d,%s",
                    fitnessClass.getClassId(),
                    fitnessClass.getClassName(),
                    fitnessClass.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")),
                    fitnessClass.getDuration(),
                    fitnessClass.getTrainerId(),
                    fitnessClass.getMaxParticipants(),
                    fitnessClass.getDescription());

            if (fitnessClass instanceof GroupClass) {
                GroupClass gc = (GroupClass) fitnessClass;
                line += String.format(",GROUP,%s", gc.getGroupType());
            } else if (fitnessClass instanceof PersonalTraining) {
                PersonalTraining pt = (PersonalTraining) fitnessClass;
                line += String.format(",PERSONAL,%s", pt.getFocusArea());
            }

            writer.write(line);
            writer.newLine();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get all classes
    public List<FitnessClass> getAllClasses() {
        List<FitnessClass> classes = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 7) {
                    String classId = parts[0];
                    String className = parts[1];
                    LocalDateTime dateTime = LocalDateTime.parse(parts[2], DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
                    int duration = Integer.parseInt(parts[3]);
                    String trainerId = parts[4];
                    int maxParticipants = Integer.parseInt(parts[5]);
                    String description = parts[6];

                    if (parts.length > 7 && parts[7].equals("GROUP")) {
                        String groupType = parts[8];
                        classes.add(new GroupClass(classId, className, dateTime, duration, trainerId,
                                maxParticipants, description, groupType));
                    } else if (parts.length > 7 && parts[7].equals("PERSONAL")) {
                        String focusArea = parts[8];
                        classes.add(new PersonalTraining(classId, className, dateTime, duration, trainerId,
                                maxParticipants, description, focusArea));
                    } else {
                        classes.add(new FitnessClass(classId, className, dateTime, duration, trainerId,
                                maxParticipants, description));
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return classes;
    }

    // Get classes by trainer ID
    public List<FitnessClass> getClassesByTrainer(String trainerId) {
        List<FitnessClass> allClasses = getAllClasses();
        List<FitnessClass> trainerClasses = new ArrayList<>();

        for (FitnessClass fc : allClasses) {
            if (fc.getTrainerId().equals(trainerId)) {
                trainerClasses.add(fc);
            }
        }
        return trainerClasses;
    }

    // Search classes by name, date or trainer
    public List<FitnessClass> searchClasses(String query) {
        List<FitnessClass> allClasses = getAllClasses();
        List<FitnessClass> results = new ArrayList<>();

        for (FitnessClass fc : allClasses) {
            if (fc.getClassName().toLowerCase().contains(query.toLowerCase())) {
                results.add(fc);
            } else if (fc.getFormattedDateTime().toLowerCase().contains(query.toLowerCase())) {
                results.add(fc);
            } else if (fc.getTrainerId().toLowerCase().contains(query.toLowerCase())) {
                results.add(fc);
            }
        }
        return results;
    }

    // Update a class
    public boolean updateClass(FitnessClass updatedClass) {
        List<FitnessClass> classes = getAllClasses();
        boolean found = false;

        for (int i = 0; i < classes.size(); i++) {
            if (classes.get(i).getClassId().equals(updatedClass.getClassId())) {
                classes.set(i, updatedClass);
                found = true;
                break;
            }
        }

        if (found) {
            return saveAllClasses(classes);
        }
        return false;
    }

    // Delete a class
    public boolean deleteClass(String classId) {
        List<FitnessClass> classes = getAllClasses();
        boolean removed = classes.removeIf(fc -> fc.getClassId().equals(classId));

        if (removed) {
            return saveAllClasses(classes);
        }
        return false;
    }

    // Helper method to save all classes to file
    private boolean saveAllClasses(List<FitnessClass> classes) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (FitnessClass fc : classes) {
                String line = String.format("%s,%s,%s,%d,%s,%d,%s",
                        fc.getClassId(),
                        fc.getClassName(),
                        fc.getDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm")),
                        fc.getDuration(),
                        fc.getTrainerId(),
                        fc.getMaxParticipants(),
                        fc.getDescription());

                if (fc instanceof GroupClass) {
                    GroupClass gc = (GroupClass) fc;
                    line += String.format(",GROUP,%s", gc.getGroupType());
                } else if (fc instanceof PersonalTraining) {
                    PersonalTraining pt = (PersonalTraining) fc;
                    line += String.format(",PERSONAL,%s", pt.getFocusArea());
                }

                writer.write(line);
                writer.newLine();
            }
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}
