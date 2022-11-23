import UIKit

// Imprimir 0 - 10
for number in 1...10{
    print (number)
}

print("--------------------------------")

var meuImpar = [Int]()
for numero in 1...10 {
    if numero % 2 == 0 {
        print(numero)
    } else {
        meuImpar.append(numero)
    }
}
print(meuImpar)


