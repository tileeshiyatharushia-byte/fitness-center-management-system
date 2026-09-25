package lk.sliit.fitnesscenter.fitnesscenterproject.dao;

import lk.sliit.fitnesscenter.fitnesscenterproject.model.Member;
import lk.sliit.fitnesscenter.fitnesscenterproject.model.Review;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

public class ReviewDAO {
    private static final String FILE_PATH = System.getProperty("user.home") + "/FitnessCenter/reviews.txt";
    private static final String DELIMITER = "|";
    private static final String HEADER = "reviewId|memberId|trainerId|classId|rating|comment|reviewDate";
    private static int lastId = 0;

    static {
        // Create directory if it doesn't exist
        try {
            Path dir = Paths.get(System.getProperty("user.home"), "FitnessCenter");
            if (!Files.exists(dir)) {
                Files.createDirectories(dir);
            }
            // Create empty file if it doesn't exist
            if (!Files.exists(Paths.get(FILE_PATH))) {
                Files.write(Paths.get(FILE_PATH), HEADER.getBytes());
            }
        } catch (IOException e) {
            System.err.println("Failed to initialize review storage: " + e.getMessage());
        }
    }

    // Create a new review
    public void addReview(Review review) {
        List<Review> reviews = getAllReviews();
        review.setReviewId(++lastId);
        review.setReviewDate(LocalDate.now());
        reviews.add(review);
        saveReviews(reviews);
    }

    // Get all reviews
    public List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        if (!Files.exists(Paths.get(FILE_PATH))) {
            return reviews;
        }

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            // Skip header line
            reader.readLine();

            String line;
            while ((line = reader.readLine()) != null) {
                if (!line.trim().isEmpty()) {
                    Review review = parseReview(line);
                    if (review != null) {
                        reviews.add(review);
                    }
                }
            }

            if (!reviews.isEmpty()) {
                lastId = reviews.get(reviews.size() - 1).getReviewId();
            }
        } catch (IOException e) {
            System.err.println("Error reading reviews: " + e.getMessage());
        }
        return reviews;
    }

    private Review parseReview(String line) {
        try {
            String[] parts = line.split("\\" + DELIMITER, -1); // -1 keeps empty strings

            Review review = new Review();
            review.setReviewId(Integer.parseInt(parts[0]));
            review.setMemberId(Integer.parseInt(parts[1]));
            review.setRating(Integer.parseInt(parts[2]));
            review.setComment(parts[3]);
            review.setReviewDate(LocalDate.parse(parts[4]));

            return review;
        } catch (Exception e) {
            System.err.println("Error parsing review line: " + line);
            return null;
        }
    }

    // Save all reviews to text file
    private void saveReviews(List<Review> reviews) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(FILE_PATH))) {
            writer.println(HEADER);
            for (Review review : reviews) {
                writer.println(formatReview(review));
            }
        } catch (IOException e) {
            System.err.println("Error saving reviews: " + e.getMessage());
        }
    }

    private String formatReview(Review review) {
        return String.join(DELIMITER,
                String.valueOf(review.getReviewId()),
                String.valueOf(review.getMemberId()),
                String.valueOf(review.getRating()),
                review.getComment(),
                review.getReviewDate().toString()
        );
    }



    // Update a review
    public boolean updateReview(Review updatedReview) {
        List<Review> reviews = getAllReviews();
        for (int i = 0; i < reviews.size(); i++) {
            if (reviews.get(i).getReviewId() == updatedReview.getReviewId()) {
                reviews.set(i, updatedReview);
                saveReviews(reviews);
                return true;
            }
        }
        return false;
    }

    // Delete a review
    public boolean deleteReview(int reviewId) {
        List<Review> reviews = getAllReviews();
        boolean removed = reviews.removeIf(review -> review.getReviewId() == reviewId);
        if (removed) {
            saveReviews(reviews);
        }
        return removed;
    }

    // Queue for membership renewal requests
    private final Queue<Integer> renewalQueue = new LinkedList<>();

    public void addRenewalRequest(int memberId) {
        renewalQueue.add(memberId);
    }

    public Integer processNextRenewal() {
        return renewalQueue.poll();
    }

    // Insertion sort for members by last renewal date
    public void sortMembersByRenewalDate(List<Member> members) {
        for (int i = 1; i < members.size(); i++) {
            Member key = members.get(i);
            int j = i - 1;

            while (j >= 0 && members.get(j).getLastRenewalDate().isAfter(key.getLastRenewalDate())) {
                members.set(j + 1, members.get(j));
                j--;
            }
            members.set(j + 1, key);
        }
    }
}