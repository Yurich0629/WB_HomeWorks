//1. Напишите функцию на Swift, которая принимает строку и возвращает её хеш, используя встроенную функцию hash().

 // создание и инициализация параметра, чей хэш(некое числовое значение) необходимо найти.
let parameter = "Home Work is done!"

// Объявление функции с именем checkHashValue и входным параметром: someParameter, которая возвращает хэш нашей строки.
func checkHashValue(_ someParameter: String) -> Int {
    return someParameter.hashValue
}

checkHashValue(parameter)
// результат(динамический): 2 426 452 988 516 133 192
