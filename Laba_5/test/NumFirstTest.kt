import org.junit.jupiter.api.Assertions.*

class simpleNumFuncTest {

    @org.junit.jupiter.api.Test
    fun max3() {
        val main = NumFirst()
        val expected = 10
        assertEquals(expected, main.max3(3,10,5))
    }

    @org.junit.jupiter.api.Test
    fun factup() {
        val main = NumFirst()
        val expected = 120
        assertEquals(expected, main.factup(5))
    }

    @org.junit.jupiter.api.Test
    fun factdown() {
        val main = NumFirst()
        val expected = 720
        assertEquals(expected, main.factdown(6))
    }

    @org.junit.jupiter.api.Test
    fun calc() {
        val main = NumFirst()
        val expected = 10
        assertEquals(expected, main.calc(true)(1234))
    }

    @org.junit.jupiter.api.Test
    fun sumd() {
        val main = NumFirst()
        val expected = 15
        assertEquals(expected, main.sumd(12345))
    }

    @org.junit.jupiter.api.Test
    fun muld() {
        val main = NumFirst()
        val expected = 126
        assertEquals(expected, main.muld(367))
    }

    @org.junit.jupiter.api.Test
    fun maxd() {
        val main = NumFirst()
        val expected = 7
        assertEquals(expected, main.maxd(123745))
    }

    @org.junit.jupiter.api.Test
    fun mind() {
        val main = NumFirst()
        val expected = 2
        assertEquals(expected, main.mind(923745))
    }
}