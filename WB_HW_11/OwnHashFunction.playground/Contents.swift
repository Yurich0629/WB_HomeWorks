//Придумайте и реализуйте собственную простую хеш-функцию для строк.

// создание кастомной функции с использованием экземпляра Hasher, комбинирование значений с помощью метода combine(_:) и завершение хэширования методом finalize(). Этот подход обеспечивает совместимость с протоколом Hashable и правильное поведение при использовании хэш-значений в коллекциях
func customHashFunc(_ string: String) -> Int {
    var hasher = Hasher()
    hasher.combine(string)
    return hasher.finalize()
}

// Реализация
let string = "Hello, world!"
let hash = customHashFunc(string)
print("Custom hash value: \(hash)")


