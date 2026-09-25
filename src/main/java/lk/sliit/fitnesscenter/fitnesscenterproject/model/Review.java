package lk.sliit.fitnesscenter.fitnesscenterproject.model;

import java.io.Serializable;
import java.time.LocalDate;

public class Review implements Serializable {
    private int reviewId;
    private int memberId;
    private int rating;
    private String comment;
    private LocalDate reviewDate;

    public Review() {
    }

    public Review(int reviewId, int memberId,  int rating, String comment, LocalDate reviewDate) {
        this.reviewId = reviewId;
        this.memberId = memberId;
        this.rating = rating;
        this.comment = comment;
        this.reviewDate = reviewDate;
    }

    // Getters and Setters
    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }


    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDate getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(LocalDate reviewDate) {
        this.reviewDate = reviewDate;
    }
}