import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CombObject {
    //ЗАДАНИЕ 3 ВАРИАНТ 6 ОБЪЕКТ 3: ПОДМНОЖЕСТВА
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


    //ЗАДАНИЕ 3 ВАРИАНТ 6 ОБЪЕКТ 3: СОЧЕТАНИЯ С ПОВТОРЕНИЯМИ
    public static void main(String[] args) {
        String set = "ABC";
        int length = 2;
        List<String> combination = new ArrayList<>();
        List<List<String>> allCombinations = new ArrayList<>();
        generateCombinations(set, length, 0, combination, allCombinations);
        writeCombinationsToFile(allCombinations);
    }

    private static void generateCombinations(String set, int length, int start, List<String> combination, List<List<String>> allCombinations) {
        if (combination.size() == length) {
            allCombinations.add(new ArrayList<>(combination));
            return;
        }

        for (int i = start; i < set.length(); i++) {
            combination.add(String.valueOf(set.charAt(i)));
            generateCombinations(set, length, i, combination, allCombinations);
            combination.remove(combination.size() - 1);
        }
    }

    private static void writeCombinationsToFile(List<List<String>> combinations) {
        try (FileWriter writer = new FileWriter("repeat.txt")) {
            for (List<String> combination : combinations) {
                writer.write(combination.toString() + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}