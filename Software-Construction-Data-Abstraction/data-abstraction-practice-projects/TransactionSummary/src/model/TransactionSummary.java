package model;

import java.util.ArrayList;
import java.util.List;

public class TransactionSummary {

    private String name;
    private List<Transaction> transactions;

    public TransactionSummary(String name) {

        this.name = name;
        transactions = new ArrayList<Transaction>();
    }

    // getters
    public String getName() {

        return this.name;
    }
    public List<Transaction> getTransactions() {

        return this.transactions;
    }
    public int getNumTransactions() {
        return this.transactions.size();
    }

    // REQUIRES: t is not already within transactions
    // MODIFIES: this
    // EFFECTS: adds the given transaction t to the list of transactions
    public void addTransaction(Transaction t) {
        this.transactions.add(t);
    }

    // REQUIRES: transactions is non-empty
    // EFFECTS: computes the average amount of money spent on a transaction
    public double averageTransactionCost() {
        double sum = 0;
        for (Transaction trans : this.transactions) sum += trans.getAmount();
        if (this.transactions.size() == 0) return 0.0;
        return sum / this.transactions.size();
    }

    // REQUIRES: transactions is non-empty
    // EFFECTS:  returns the average cost of all transactions of type specificType in this
    //           TransactionSummary
    public double specificTypeAverage(TransactionType specificType) {
        double sum = 0; int sz = 0;
        for (Transaction trans : this.transactions)  if (trans.getType() == specificType) {sum += trans.getAmount(); sz++;}
        if (sz == 0) return 0.0;
        return sum / sz;
    }

    // REQUIRES: transactions is non-empty
    // EFFECTS: returns the largest transaction (in terms of cost) in this TransactionSummary
    public Transaction largestTransaction() {
        int mx = 0; Transaction t = null;
        for (Transaction trans : this.transactions) if (trans.getAmount() > mx) {mx = trans.getAmount(); t = trans;}
        return t;
    }

    // EFFECTS: returns true if the given transaction is contained within the list of transactions
    public boolean contains(Transaction t) {
        for (Transaction trans : this.transactions) if (trans == t) return true;
        return false;
    }


}
