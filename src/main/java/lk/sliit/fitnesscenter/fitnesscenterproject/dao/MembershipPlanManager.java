package lk.sliit.fitnesscenter.fitnesscenterproject.dao;

import lk.sliit.fitnesscenter.fitnesscenterproject.queue.MembershipPlanQueue;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.MembershipPlan;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class MembershipPlanManager {
    private static final String FILE_PATH = System.getProperty("user.home") + "/FitnessCenter/plans.txt";
    private MembershipPlanQueue planQueue = MembershipPlanQueue.getInstance();

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

    public void addPlan(MembershipPlan plan) {
        planQueue.addToQueue(plan);
        processQueue();
    }

    public MembershipPlan dequeuePlan() {
        return planQueue.processNextPlan();
    }

    private void processQueue() {
        while (!planQueue.isEmpty()) {
            MembershipPlan plan = planQueue.processNextPlan();
            if (plan != null) {
                savePlanToFile(plan);
            }
        }
    }

    private void savePlanToFile(MembershipPlan plan) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(plan.toString());
            writer.newLine();
        } catch (IOException e) {
            System.out.println("Error writing to file: " + e.getMessage());
        }
    }

    public List<MembershipPlan> getAllPlans() {
        List<MembershipPlan> plans = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] data = line.split(",");
                if (data.length < 4) {
                    System.out.println("Skipping invalid line: " + line);
                    continue;
                }
                MembershipPlan plan = new MembershipPlan(data[0], data[1], Integer.parseInt(data[2]), Double.parseDouble(data[3]));
                plans.add(plan);
            }
        } catch (IOException e) {
            System.out.println("Error writing to file: " + e.getMessage());
        }
        return plans;
    }

    public void updatePlan(String planId, MembershipPlan updatedPlan) {
        List<MembershipPlan> plans = getAllPlans();
        for (int i = 0; i < plans.size(); i++) {
            if (plans.get(i).getPlanId().equals(planId)) {
                plans.set(i, updatedPlan);
                break;
            }
        }
        saveAllPlans(plans);
    }

    public void deletePlan(String planId) {
        List<MembershipPlan> plans = getAllPlans();
        plans.removeIf(plan -> plan.getPlanId().equals(planId));
        saveAllPlans(plans);
    }

    private void saveAllPlans(List<MembershipPlan> plans) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (MembershipPlan plan : plans) {
                writer.write(plan.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error saving to file: " + e.getMessage());
        }
    }
}