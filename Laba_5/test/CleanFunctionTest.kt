import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

class CleanFunctionTest {

    @Test
    fun minNum() {
        val main = CleanFunction()
        val expected = 1
        assertEquals(expected, main.minNum(346198))
    }

    @Test
    fun kolNum3() {
        val main = CleanFunction()
        val expected = 2
        assertEquals(expected, main.kolNum3(4812357))
    }

    @Test
    fun delsNum() {
        val main = CleanFunction()
        val expected = 6
        assertEquals(expected, main.delsNum(12))
    }

    @Test
    fun minNumRecUP() {
        val main = CleanFunction()
        val expected = 1
        assertEquals(expected, main.minNumRecUP(346198))
    }

    @Test
    fun kolNum3RecUP() {
        val main = CleanFunction()
        val expected = 2
        assertEquals(expected, main.kolNum3RecUP(48123))
    }

    @Test
    fun delsNumRecUP() {
        val main = CleanFunction()
        val expected = 6
        assertEquals(expected, main.delsNumRecUP(12,1))
    }

    @Test
    fun minNumRecTail() {
        val main = CleanFunction()
        val expected = 1
        assertEquals(expected, main.minNumRecTail(346198,9))
    }

    @Test
    fun kolNum3RecTail() {
        val main = CleanFunction()
        val expected = 2
        assertEquals(expected, main.kolNum3RecTail(4812357,0))
    }

    @Test
    fun delsNumRecTail() {
        val main = CleanFunction()
        val expected = 6
        assertEquals(expected, main.delsNumRecTail(12,1,0))
    }
}