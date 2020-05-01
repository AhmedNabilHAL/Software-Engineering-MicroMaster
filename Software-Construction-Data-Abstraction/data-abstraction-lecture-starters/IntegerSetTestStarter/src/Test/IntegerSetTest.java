package Test;

import model.IntegerSet;
import org.junit.Before;
import org.junit.Test;

import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

public class IntegerSetTest {
    private IntegerSet testSet;

    @Before
    public void setup(){
        testSet = new IntegerSet();
    }


    @Test
    public void testInsertNotThere() {
        // check that the number is not already in the set
        checkDoesnNotContain(3);
        // insert the number into the set
        testSet.insert(3);
        // check that the number is in the set once
        checkDoesContain(3);

    }

    private void checkDoesnNotContain(int n) {
        assertEquals(testSet.size(), 0);
        assertFalse(testSet.contains(n));
    }

    @Test
    public void TestInsertAlreadyThere() {
        // check that the number is not already in the set
        checkDoesnNotContain(3);
        // insert the number into the set
        testSet.insert(3);
        // check that the number is in the set once
        checkDoesContain(3);

        // insert the number againinto the set
        testSet.insert(3);
        // check that the number is in the set once
        checkDoesContain(3);
    }

    private void checkDoesContain(int n) {
        assertEquals(testSet.size(), 1);
        assertTrue(testSet.contains(n));
    }
}
