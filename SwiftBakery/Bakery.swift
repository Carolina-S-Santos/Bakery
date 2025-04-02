//
//  Bakery.swift
//  Bakery
//
//  Created by aluno-111 on 31/03/25.
//

import Foundation

enum UserType: String, Codable {
    case admin, attendant
}

enum ProductType {
    case Pastries, Cakes, Dairy, Bread, Beverages, Ingredients
}

enum Origin {
    case Manufactured, Supplied
}

enum SoldBy {
    case weight, unit
}

class Bakery {
    
    static var stock : [Product: Int] = [:]
    var loggedUser : User?
    var employees : [User] = []
    static var users : [User] =  [
        Admin(username: "superAdmin", password: "12345", userType: UserType.admin),
        User(username: "carlos", password: "12345", userType: UserType.attendant)]

    init(loggedUser: User? = nil, employees: [User]) {
        self.loggedUser = loggedUser
        self.employees = employees
        
        var croissant: Product = Product(name: "Croissant", type: .Pastries, costs: 2.0, price: 5.0, origin: .Manufactured, soldBy: .unit)
        var chocolateCake: Product = Product(name: "Chocolate Cake", type: .Cakes, costs: 3.0, price: 7.0, origin: .Manufactured, soldBy: .unit)
        var cheese: Product = Product(name: "Cheese", type: .Dairy, costs: 1.5, price: 4.0, origin: .Supplied, soldBy: .weight)
        var wholeWheatBread: Product = Product(name: "Whole Wheat Bread", type: .Bread, costs: 1.0, price: 2.5, origin: .Manufactured, soldBy: .unit)
        var coffee: Product = Product(name: "Coffee", type: .Beverages, costs: 1.2, price: 3.0, origin: .Supplied, soldBy: .weight)
        var flour: Product = Product(name: "Flour", type: .Ingredients, costs: 0.8, price: 2.0, origin: .Supplied, soldBy: .weight)
        var vanillaCake: Product = Product(name: "Vanilla Cake", type: .Cakes, costs: 3.2, price: 7.5, origin: .Manufactured, soldBy: .unit)
        var butter: Product = Product(name: "Butter", type: .Dairy, costs: 1.8, price: 4.5, origin: .Supplied, soldBy: .weight)
        var sourdoughBread: Product = Product(name: "Sourdough Bread", type: .Bread, costs: 1.3, price: 3.0, origin: .Manufactured, soldBy: .unit)
        var icedTea: Product = Product(name: "Iced Tea", type: .Beverages, costs: 1.0, price: 2.8, origin: .Supplied, soldBy: .unit)
        var sugar: Product = Product(name: "Sugar", type: .Ingredients, costs: 0.5, price: 1.5, origin: .Supplied, soldBy: .weight)


        var products: [Product] = [
        croissant,
        chocolateCake,
        cheese,
        wholeWheatBread,
        coffee,
        flour,
        vanillaCake,
        butter,
        sourdoughBread,
        icedTea,
        sugar
        ]
        
        Bakery.stock = [croissant : 15, flour : 30, icedTea : 10, sugar : 35, vanillaCake : 5]
    }
    
    static func login(){
        for user in Bakery.users {
            print(user.username, user.password, user.userType)
        }
        
        print("Swift Bakery")
        print("Enter your username: ")
        var username = readLine()
        
        for user in Bakery.users {
            if username == user.username {
                print("Enter your password: ")
                var password = readLine()
                
                if let user = user as? Admin {
                    user.showAdminMenu()
                } else {
                    if let user = user as? Attendant {
                        user.showAttendantMenu()
                        user.checkStorage(stock: Bakery.stock)
                    }
                }
            } else {
                print("Usuário não encontrado")
            }
            break
        }
    }
        
    
}

struct Product: Hashable {
    var name : String
    var type : ProductType
    var costs : Double
    var price : Double
    var origin : Origin
    var soldBy : SoldBy
}


     
