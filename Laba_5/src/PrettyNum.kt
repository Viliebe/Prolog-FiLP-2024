fun factorial(n: Int): Int {
    return if (n == 0) 1 else n * factorial(n - 1)
}

fun sumOfFactorialDigits(n: Int): Int {
    return if (n == 0) 0 else factorial(n % 10) + sumOfFactorialDigits(n / 10)
}

fun isCuriousNumber(n: Int): Boolean {
    return n == sumOfFactorialDigits(n)
}

fun findCuriousNumbersSum(limit: Int): Int {
    return (10 until limit)
        .filter(::isCuriousNumber)
        .sum()
}

fun main() {
    val result = findCuriousNumbersSum(100000)
    println(result)
} 