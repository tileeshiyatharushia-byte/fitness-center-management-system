package lk.sliit.fitnesscenter.fitnesscenterproject.queue;

import lk.sliit.fitnesscenter.fitnesscenterproject.model.MembershipPlan;

public class MembershipPlanQueue {
    private static MembershipPlanQueue instance;
    private MembershipPlan[] queue;
    private int capacity;
    private int front;
    private int rear;
    private int size;

    private MembershipPlanQueue() {
        capacity = 100; // Initial capacity
        queue = new MembershipPlan[capacity];
        front = 0;
        rear = -1;
        size = 0;
    }

    public static MembershipPlanQueue getInstance() {
        if (instance == null) {
            instance = new MembershipPlanQueue();
        }
        return instance;
    }

    public void addToQueue(MembershipPlan plan) {
        if (isFull()) {
            resize();
        }
        rear = (rear + 1) % capacity;
        queue[rear] = plan;
        size++;
    }

    public MembershipPlan processNextPlan() {
        if (isEmpty()) {
            return null;
        }
        MembershipPlan plan = queue[front];
        queue[front] = null; // Clear the reference
        front = (front + 1) % capacity;
        size--;
        return plan;
    }

    public boolean isEmpty() {
        return size == 0;
    }

    public boolean isFull() {
        return size == capacity;
    }

    public int getQueueSize() {
        return size;
    }

    public MembershipPlan peek() {
        if (isEmpty()) {
            return null;
        }
        return queue[front];
    }

    private void resize() {
        int newCapacity = capacity * 2;
        MembershipPlan[] newQueue = new MembershipPlan[newCapacity];

        for (int i = 0; i < size; i++) {
            newQueue[i] = queue[(front + i) % capacity];
        }

        queue = newQueue;
        capacity = newCapacity;
        front = 0;
        rear = size - 1;
    }
}