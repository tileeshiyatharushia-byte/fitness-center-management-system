package lk.sliit.fitnesscenter.fitnesscenterproject.dao;


import lk.sliit.fitnesscenter.fitnesscenterproject.model.Member;

import java.io.*;
import java.time.LocalDate;
import java.util.*;

public class MemberManager {
    private static final String FILE_PATH = System.getProperty("user.home") + "/FitnessCenter/members.txt";
    private Queue<Member> renewalQueue = new LinkedList<>();

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


    // Add a new member
    public void addMember(Member member) {
        System.out.println("Adding new member: " + member.getMemberId());
        File file = new File(FILE_PATH);
        file.getParentFile().mkdirs();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(member.toString());
            writer.newLine();
        } catch (IOException e) {
            System.err.println("Error writing to file: " + e.getMessage());
        }
    }


    // Get all members
    public List<Member> getAllMembers() {
        List<Member> members = new ArrayList<>();
        File file = new File(FILE_PATH);

        if (!file.exists()) {
            System.out.println("File not found at: " + FILE_PATH);
            return members;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;

                String[] data = line.split(",");
                if (data.length < 7) {
                    System.err.println("Skipping invalid line: " + line);
                    continue;
                }


                try {
                    LocalDate lastRenewalDate = LocalDate.parse(data[6]);
                    Member member = new Member(data[0], data[1], data[2], data[3], data[4], data[5], lastRenewalDate);
                    members.add(member);
                } catch (Exception e) {
                    System.err.println("Skipping malformed entry: " + line);
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading file: " + e.getMessage());
        }
        return members;

    }


    // Update members
    public void updateMember(Member updatedMember) {
        List<Member> members = getAllMembers();
        boolean found = false;

        for (int i = 0; i < members.size(); i++) {
            if (members.get(i).getMemberId().equals(updatedMember.getMemberId())) {
                members.set(i, updatedMember);
                found = true;
                break;
            }
        }

        if (found) {
            saveAllMembers(members);
        } else {
            System.err.println("Member not found: " + updatedMember.getMemberId());
        }
    }



    // Delete member
    public boolean deleteMember(String memberId) {
        System.out.println("Attempting to delete member with ID: " + memberId);
        List<Member> members = getAllMembers();
        System.out.println("Current member count: " + members.size());

        boolean removed = members.removeIf(member -> {
            boolean match = member.getMemberId().equals(memberId);
            System.out.println("Checking member: " + member.getMemberId() + " - " + (match ? "MATCH" : "no match"));
            return match;
        });

        System.out.println("Member removed: " + removed);
        System.out.println("New member count: " + members.size());

        if (removed) {
            try {
                saveAllMembers(members);
                System.out.println("Members saved successfully after deletion");
                return true;
            } catch (Exception e) {
                System.err.println("Error saving after deletion: " + e.getMessage());
                return false;
            }
        }
        return false;
    }

    // Sort members
    public List<Member> sortMembersByRenewalDate(List<Member> members) {
        for (int i = 1; i < members.size(); i++) {
            Member key = members.get(i);
            int j = i - 1;
            while (j >= 0 && members.get(j).getLastRenewalDate().isAfter(key.getLastRenewalDate())) {
                members.set(j + 1, members.get(j));
                j--;
            }
            members.set(j + 1, key);
        }
        return members;
    }


    public Member authenticate(String email, String password) {
        return getAllMembers().stream()
                .filter(m -> m.getEmail().equals(email) && m.getPassword().equals(password))
                .findFirst()
                .orElse(null);
    }


    //method for memberId already exit
    public boolean memberExists(String memberId) {
        return getAllMembers().stream()
                .anyMatch(m -> m.getMemberId().equals(memberId));
    }

    public void addToRenewalQueue(Member member) {
        renewalQueue.add(member);
    }

    public Member processRenewalMemberRequest() {
        return renewalQueue.poll();
    }

    private void saveAllMembers(List<Member> members) {
        File file = new File(FILE_PATH);
        file.getParentFile().mkdirs();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Member member : members) {
                writer.write(member.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error saving to file: " + e.getMessage());
            throw new RuntimeException("Failed to save members", e);
        }
    }


}