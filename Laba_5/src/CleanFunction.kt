class CleanFunction {
//Найти минимальную цифру числа
    fun minNum(num: Int): Int{
        if (num == 0) return 0
        var min = 9
        var temp = num
        while (temp != 0){
            val digit = temp % 10
            if (digit < min){
                min = digit
            }
            temp /= 10
        }
        return min
    }

//Найти количество цифр числа меньших 3
    fun kolNum(num: Int): Int{
        if (num == 0) return 1
        var count = 0
        var temp = num
        while (temp != 0){
            val digit = temp % 10
            if (digit < 3){
                count++
            }
            temp /= 10
        }
        return count
    }

//Найти количество делителей числа
    fun delsNum(num: Int): Int{
        var count = 0
        for (i in 1.. num){
            if (num % i == 0) count ++
        }
        return count
    }

    //Найти минимальную цифру числа рекурсией вверх
    fun minNumRecUP(num: Int): Int =
        if (num < 10) num else if (num % 10 < minNumRecUP(num / 10))
            num % 10 else minNumRecUP(num / 10)

    //Найти количество цифр числа меньших 3 рекурсией вверх
    fun kolNum3RecUP(num: Int): Int =
        if (num == 0 ) 0 else if (num < 10 && num < 3) 1 else
            if (num % 10 < 3 ) 1 + kolNum3RecUP(num / 10)
            else kolNum3RecUP(num / 10)

    //Найти количество делителей числа рекурсией вверх
    fun delsNumRecUP(num: Int, divisor: Int = 1): Int {
        if (divisor > num / 2) {
            return if (num % divisor == 0) 2 else 1
        }
        if (num % divisor == 0) {
            return 1 + delsNumRecUP(num, divisor + 1)
        } else {
            return delsNumRecUP(num, divisor + 1)
        }
    }

    //Найти минимальную цифру числа хвостовой рекурсией
    tailrec fun minNumRecTail(n: Int, minDigit: Int = 9): Int {
        if (n == 0) {
            return minDigit
        }
        val currentDigit = n % 10
        return minNumRecTail(n / 10, if (currentDigit < minDigit) currentDigit else minDigit)
    }

    //Найти количество цифр числа меньших 3 хвостовой рекурсией
    tailrec fun kolNum3RecTail(num: Int, count: Int = 0): Int {
        if (num == 0) {
            return count
        }
        val currentDigit = num % 10
        return kolNum3RecTail(num / 10, if (currentDigit < 3) count + 1 else count)
    }

    //Найти количество делителей числа хвостовой рекурсией
    tailrec fun delsNumRecTail(num: Int, divisor: Int = 1, count: Int = 0): Int {
        if (num < divisor) {
            return count
        }
        return if (num % divisor == 0) {
            delsNumRecTail(num, divisor + 1, count + 1)
        } else {
            delsNumRecTail(num, divisor + 1, count)
        }
    }

    //Функция высшего порядка на 1 аргумент
    fun oneElementOf(x:Int,f:(Int)->Int):Int= f(x)

    //Функция высшего порядка на 2 аргумента
    fun twoElementOf(x:Int,y:Int,f:(Int,Int)->Int) = f(x,y)

    //Функция высшего порядка на 3 аргумента
    fun threeElementOf(x:Int,y:Int,z:Int,f:(Int,Int,Int)->Int) = f(x,y,z)

    fun main() {
        //val scanner = Scanner(`in`)
        //val x: Int = scanner.nextInt()
        println(kolNum3RecUP(8712))
    }
}  

fun main() = CleanFunction().main()