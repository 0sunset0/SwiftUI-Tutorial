// main.swift
//getter, setter -> 캡슐화가 아니다..
class Drink {
    let name: String
    private(set) var amount: Double

    init(name: String, amount: Double) {
        self.name = name
        self.amount = amount
    }

    func reduce(quantity: Double) {
        if amount >= quantity {
            amount -= quantity
            print("[\(name)] \(quantity)ml 줄었습니다. 남은 양: \(amount)ml")
        } else {
            print("[\(name)] 양이 부족합니다. (요청: \(quantity)ml, 현재: \(amount)ml)")
        }
    }
}

class Alice {
    private(set) var height: Double

    init(height: Double) {
        self.height = height
    }

    func drink(_ drink: Drink, quantity: Double) {
        print("\n앨리스가 \(drink.name)을 \(quantity)ml 마십니다...")
        height -= quantity * 0.5
        print("[앨리스] 키가 줄었습니다. 현재 키: \(height)cm")
        drink.reduce(quantity: quantity)
    }
}

let alice = Alice(height: 160)
let magicDrink = Drink(name: "마법 음료", amount: 100)

print("=== 초기 상태 ===")
print("앨리스 (키: \(alice.height)cm)")
print("\(magicDrink.name) (\(magicDrink.amount)ml)")

alice.drink(magicDrink, quantity: 30)
alice.drink(magicDrink, quantity: 30)
alice.drink(magicDrink, quantity: 60)

print("\n=== 최종 상태 ===")
print("앨리스 (키: \(alice.height)cm)")
print("\(magicDrink.name) (\(magicDrink.amount)ml)")
