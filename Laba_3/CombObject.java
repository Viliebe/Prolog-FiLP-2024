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
    // public static void main(String[] args) {
    //     int n = 5; // Количество элементов в наборе
    //     int k = 3; // Максимальное количество повторений для каждого элемента
    //     try {
    //         generateAndWriteNonRecursiveCombinations(n, k, "", "NOREPEAT.txt");
    //     } catch (IOException e) {
    //         System.out.println("Ошибка при записи в файл: " + e.getMessage());
    //     }
    // }

    // private static void generateAndWriteNonRecursiveCombinations(int n, int k, String prefix, String fileName) throws IOException {
    //     BufferedWriter writer = new BufferedWriter(new FileWriter(fileName, true));

    //     // Инициализация массива для хранения текущего сочетания
    //     int[] combination = new int[n];
    //     Arrays.fill(combination, 0); // Заполняем массив нулями, чтобы обозначить отсутствие выбранного элемента

    //     // Генерация сочетаний
    //     for (int i = 0; i < Math.pow(k + 1, n); i++) {
    //         StringBuilder sb = new StringBuilder(prefix);
    //         for (int j = 0; j < n; j++) {
    //             sb.append(combination[j]);
    //         }
    //         sb.append("\n");
    //         writer.write(sb.toString());

    //         // Переход к следующему сочетанию
    //         int carry = 1;
    //         for (int j = n - 1; j >= 0; j--) {
    //             combination[j] += carry;
    //             carry = 0;
    //             if (combination[j] > k) {
    //                 combination[j] -= k + 1;
    //                 carry = 1;
    //             }
    //         }
    //     }

    //     writer.close();
    // }


    //ЗАДАНИЕ 3 ВАРИАНТ 6 ОБЪЕКТ 7: СЛОВА ДЛИНЫ 5,
    // В КОТОРЫХ РОВНО ОДНА БУКВА ПОВТОРЯЕТСЯ 2 РАЗА,
    // ОСТАЛЬНЫЕ БУКВЫ НЕ ПОВТОРЯЮТСЯ НЕ РЕКУРСИЯ
//    public static void main(String[] args) {
//        String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
//        generateAndWriteWords(alphabet, "WORDS.txt");
//    }
//
//    private static void generateAndWriteWords(String alphabet, String fileName) {
//        try (FileWriter writer = new FileWriter(fileName)) {
//            for (int i = 0; i < alphabet.length(); i++) {
//                char repeatChar = alphabet.charAt(i);
//                for (int j = 0; j < alphabet.length(); j++) {
//                    if (j == i) continue;
//                    for (int k = 0; k < alphabet.length(); k++) {
//                        if (k == i || k == j) continue;
//                        for (int l = 0; l < alphabet.length(); l++) {
//                            if (l == i || l == j || l == k) continue;
//                            for (int m = 0; m < alphabet.length(); m++) {
//                                if (m == i) {
//                                    writer.write(repeatChar + "" + alphabet.charAt(j) + alphabet.charAt(k) + alphabet.charAt(l) + repeatChar + "\n");
//                                } else if (m == j || m == k || m == l) {
//                                    continue;
//                                } else {
//                                    writer.write(alphabet.charAt(m) + "" + alphabet.charAt(j) + alphabet.charAt(k) + alphabet.charAt(l) + alphabet.charAt(i) + "\n");
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }


//ЗАДАНИЕ 3 ВАРИАНТ 6 ОБЪЕКТ 10: СЛОВА ДЛИНЫ 9,
    // В КОТОРЫХ РОВНО 2 БУКВЫ ПОВТОРЯЮТСЯ 2 РАЗА,
    // РОВНО ОДНА БУКВА ПОВТОРЯЕТСЯ ТРИ РАЗА,
    // ОСТАЛЬНЫЕ БУКВЫ НЕ ПОВТОРЯЮТСЯ НЕ РЕКУРСИЯ
    // public static void main(String[] args) {
    //     String alphabet = "ABCDEFGHIJ";
    //     generateAndWriteWords(alphabet, "WORD.txt");
    // }

    // private static void generateAndWriteWords(String alphabet, String fileName) {
    //     try (FileWriter writer = new FileWriter(fileName)) {
    //         for (int i = 0; i < alphabet.length(); i++) {
    //             char repeatChar1 = alphabet.charAt(i);
    //             for (int j = 0; j < alphabet.length(); j++) {
    //                 char repeatChar2 = alphabet.charAt(j);
    //                 if (j == i) continue;
    //                 for (int k = 0; k < alphabet.length(); k++) {
    //                     char repeatChar3 = alphabet.charAt(k);
    //                     if (k == i || k == j) continue;
    //                     for (int l = 0; l < alphabet.length(); l++) {
    //                         if (l == i || l == j || l == k) continue;
    //                         for (int m = 0; m < alphabet.length(); m++) {
    //                             if (m == i || m == j || m == k || m == l) continue;
    //                             for (int n = 0; n < alphabet.length(); n++) {
    //                                 if (n == i || n == j || n == k || n == l || n == m) continue;
    //                                 for (int o = 0; o < alphabet.length(); o++) {
    //                                     if (o == i || o == j || o == k || o == l || o == m || o == n) continue;
    //                                     for (int p = 0; p < alphabet.length(); p++) {
    //                                         if (p == i || p == j || p == k || p == l || p == m || p == n || p == o) continue;
    //                                         for (int q = 0; q < alphabet.length(); q++) {
    //                                             if (q == i || q == j || q == k || q == l || q == m || q == n || q == o || q == p) continue;
    //                                             writer.write(repeatChar1 + "" + repeatChar1 + alphabet.charAt(l) + repeatChar2 + "" + repeatChar2 + alphabet.charAt(o) + repeatChar3 + "" + repeatChar3 + alphabet.charAt(q) + "\n");
    //                                         }
    //                                     }
    //                                 }
    //                             }
    //                         }
    //                     }
    //                 }
    //             }
    //         }
    //     } catch (IOException e) {
    //         e.printStackTrace();
    //     }
    // }
}