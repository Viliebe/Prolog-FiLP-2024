import java.time.LocalDate
import java.time.format.DateTimeFormatter

open class Driver(
    val series: String,
    val number: String,
    val issueDate: LocalDate,
    val expirationDate: LocalDate,
) : Comparable<Driver> {

    companion object {
        private val seriesPattern = Regex("^\\d{4}$")
        private val numberPattern = Regex("^\\d{6}$")
    }

    init {
        validateSeries(series)
        validateNumber(number)
    }

    override fun toString(): String {
        val formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy")
        return "Права на вождение серия: '$series', номер: '$number', дата выдачи: ${issueDate.format(formatter)},действителены до: ${
            expirationDate.format(
                formatter
            )
        }"
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false

        other as Driver

        if (series != other.series) return false
        if (number != other.number) return false

        return true
    }

    override fun hashCode(): Int {
        var result = series.hashCode()
        result = 31 * result + number.hashCode()
        return result
    }

    override fun compareTo(other: Driver): Int {
        val seriesNumberComparison = compareValuesBy(this, other, { it.series }, { it.number })
        if (seriesNumberComparison != 0) return seriesNumberComparison

        val issueDateComparison = issueDate.compareTo(other.issueDate)
        if (issueDateComparison != 0) return issueDateComparison

        return expirationDate.compareTo(other.expirationDate)
    }

    private fun validateSeries(series: String) {
        if (!seriesPattern.matches(series)) {
            throw IllegalArgumentException("Некорректный серия документа: $series")
        }
    }

    private fun validateNumber(number: String) {
        if (!numberPattern.matches(number)) {
            throw IllegalArgumentException("Некорректный номер документа: $number")
        }
    }
}

fun main(){
    val dr1=Driver("1827","308193",LocalDate.of(2017,12,31), LocalDate.of(2032,12,31))
    println(dr1.toString())
}