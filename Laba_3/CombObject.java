import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CombObject {
    //ЗАДАНИЕ 3 ВАРИАНТ 6 ОБЪЕКТ 3: ПОДМНОЖЕСТВА РЕКУРСИЯ
//    public static void main(String[] args) {
//        // Исходное множество
//        List<Integer> set = new ArrayList<>();
//        for (int i = 0; i < 5; i++) { // Пример множества от 0 до 4
//            set.add(i);
//        }
//
//        try {
//            generateAndWriteSubsets(set, "", "subsets.txt");
//        } catch (IOException e) {
//            System.out.println("Ошибка при записи в файл: " + e.getMessage());
//        }
//    }
//
//    private static void generateAndWriteSubsets(List<Integer> set, String current, String fileName) throws IOException {
//        BufferedWriter writer = new BufferedWriter(new FileWriter(fileName, true)); // Добавляем параметр тру для дописывания
//
//        if (!current.isEmpty()) {
//            writer.write(current + "\n"); // Записываем текущее подмножество
//        }
//
//        for (Integer element : set) {
//            List<Integer> subset = new ArrayList<>(set); // Создаем копию множества для избежания изменений
//            subset.remove(element); // Удаляем текущий элемент из множества
//            generateAndWriteSubsets(subset, current + element, fileName); // Рекурсивно генерируем подмножества без текущего элемента
//        }
//
//        writer.close(); // Закрываем поток записи после завершения
//    }


    //ЗАДАНИЕ 3 ВАРИАНТ 6 ОБЪЕКТ 3: СОЧЕТАНИЯ С ПОВТОРЕНИЯМИ РЕКУРСИЯ
    // public static void main(String[] args) {
    //     String set = "ABC";
    //     int length = 2;
    //     List<String> combination = new ArrayList<>();
    //     List<List<String>> allCombinations = new ArrayList<>();
    //     generateCombinations(set, length, 0, combination, allCombinations);
    //     writeCombinationsToFile(allCombinations);
    // }

    // private static void generateCombinations(String set, int length, int start, List<String> combination, List<List<String>> allCombinations) {
    //     if (combination.size() == length) {
    //         allCombinations.add(new ArrayList<>(combination));
    //         return;
    //     }

    //     for (int i = start; i < set.length(); i++) {
    //         combination.add(String.valueOf(set.charAt(i)));
    //         generateCombinations(set, length, i, combination, allCombinations);
    //         combination.remove(combination.size() - 1);
    //     }
    // }

    // private static void writeCombinationsToFile(List<List<String>> combinations) {
    //     try (FileWriter writer = new FileWriter("repeat.txt")) {
    //         for (List<String> combination : combinations) {
    //             writer.write(combination.toString() + "\n");
    //         }
    //     } catch (IOException e) {
    //         e.printStackTrace();
    //     }
    // }

    //ЗАДАНИЕ 3 ВАРИАНТ 6 ОБЪЕКТ 3: ПОДМНОЖЕСТВА НЕ РЕКУРСИЯ
    // public static void main(String[] args) {
    //     String set = "ABCDE";
    //     List<List<String>> allSubsets = generateSubsets(set);
    //     writeSubsetsToFile(allSubsets);
    // }

    // public static List<List<String>> generateSubsets(String set) {
    //     List<List<String>> subsets = new ArrayList<>();
    //     subsets.add(new ArrayList<>());  // Add empty subset

    //     for (int i = 0; i < set.length(); i++) {
    //         int size = subsets.size();
    //         for (int j = 0; j < size; j++) {
    //             List<String> subset = new ArrayList<>(subsets.get(j));
    //             subset.add(String.valueOf(set.charAt(i)));
    //             subsets.add(subset);
    //         }
    //     }

    //     return subsets;
    // }

    // public static void writeSubsetsToFile(List<List<String>> subsets) {
    //     try (FileWriter writer = new FileWriter("SUBSET.txt")) {
    //         for (List<String> subset : subsets) {
    //             writer.write(subset.toString() + "\n");
    //         }
    //     } catch (IOException e) {
    //         e.printStackTrace();
    //     }
    // }

    //ЗАДАНИЕ 3 ВАРИАНТ 6 ОБЪЕКТ 4: СОЧЕТАНИЯ С ПОВТОРЕНИЯМИ НЕ РЕКУРСИЯ
    public static void main(String[] args) {
        int n = 5; // Количество элементов в наборе
        int k = 3; // Максимальное количество повторений для каждого элемента
        try {
            generateAndWriteNonRecursiveCombinations(n, k, "", "NOREPEAT.txt");
        } catch (IOException e) {
            System.out.println("Ошибка при записи в файл: " + e.getMessage());
        }
    }

    private static void generateAndWriteNonRecursiveCombinations(int n, int k, String prefix, String fileName) throws IOException {
        BufferedWriter writer = new BufferedWriter(new FileWriter(fileName, true));

        // Инициализация массива для хранения текущего сочетания
        int[] combination = new int[n];
        Arrays.fill(combination, 0); // Заполняем массив нулями, чтобы обозначить отсутствие выбранного элемента

        // Генерация сочетаний
        for (int i = 0; i < Math.pow(k + 1, n); i++) {
            StringBuilder sb = new StringBuilder(prefix);
            for (int j = 0; j < n; j++) {
                sb.append(combination[j]);
            }
            sb.append("\n");
            writer.write(sb.toString());

            // Переход к следующему сочетанию
            int carry = 1;
            for (int j = n - 1; j >= 0; j--) {
                combination[j] += carry;
                carry = 0;
                if (combination[j] > k) {
                    combination[j] -= k + 1;
                    carry = 1;
                }
            }
        }

        writer.close();
    }
}