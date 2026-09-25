package lk.sliit.fitnesscenter.fitnesscenterproject.model;

public class MembershipPlan {
    private String planId;
    private String planName;
    private int duration;
    private double price;

    //default constructor
    public MembershipPlan(){

    }

    //parameterize constructor
    public MembershipPlan(String planId, String planName, int duration, double price) {
        this.planId = planId;
        this.planName = planName;
        this.duration = duration;
        this.price = price;
    }

    //Getters and Setters
    public String getPlanId() {
        return planId;
    }

    public void setPlanId(String planId) {
        this.planId = planId;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return planId + "," + planName + "," + duration + "," + price;
    }
}