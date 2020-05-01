package test;
import model.Transaction;

import org.junit.Before;
import org.junit.Test;

import model.TransactionType;

import static junit.framework.TestCase.assertEquals;
import static model.TransactionType.ENTERTAINMENT;


public class TransactionTest {
    Transaction testTransaction;
    String name, date;
    int amount;
    TransactionType type;
    @Before
    public void setUp(){
        name = "Movie"; date = "May 1st"; amount = 10; type = ENTERTAINMENT;
        testTransaction = new Transaction(name, date, amount, type);
    }

    @Test
    public void testConstructor(){
        assertEquals(testTransaction.getName(), name);
        assertEquals(testTransaction.getDate(), date);
        assertEquals(testTransaction.getAmount(), amount);
        assertEquals(testTransaction.getType(), type);
    }
}
