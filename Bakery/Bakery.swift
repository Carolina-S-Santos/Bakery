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

class Bakery {
    
    var stock : [Products: Int] = [:]
    var loggedUser : User 
    var employees : [User] = []
    var suppliers : [Supplier] = []
//    let superAdmin : User =
    var users : [User]

    init() {
        users = MockData.users()  
    }
    
    func login(){
        for user in users {
            print(user.username, user.password, user.userType)
        }
        print("Swift Bakery")
        print("Enter your username: ")
        var username = readLine()
        
        for user in users {
            if username == user.username {
                print("Enter your password: ")
                var password = readLine()
                if user.userType == .admin {
                    showAdminMenu()
                } else {
                    showAttendantMenu()
                }
            } else {
                print("Usuário não encontrado")
            }
        }
    }
    
    func showAdminMenu(){
        print("Choose an option:")
        print("1 - Register supplier")
        print("2 - Create new attendant account")
        print("3 - Delete attendant account")
        print("4 - Check attendant account")
        print("5 - Print sales report")
        print("6 - Exit")
        
        let option = readLine()
        let firstDigit = option?.first

        switch firstDigit {
            case "1": registerSupplier()
            case "2": createAttendantAccount()
            case "3" : deleteAttendantAccount()
            case "4": checkAttendantAccount()
            case "5": printSalesReport()
            case "6": login()
            default: showAdminMenu()
        }
        
    }
    
    func showAttendantMenu(){
        print("Choose an option:")
        print("1 - Check storage")
        print("2 - Make a sale")
        print("3 - Exit")
        
        let option = readLine()
        let firstDigit = option?.first
        switch firstDigit {
            case "1": checkStorage()
            case "2": makeSale()
            case "3": login()
            default: showAttendantMenu()
        }
        
    }

    func registerSupplier(){
        print("Enter supplier name: ")
        var name = readLine()
        
        if let name = name {
            var productType : [ProductType] = []
            var isAddingProducts = true
            while isAddingProducts {
                print("Enter the product type this supplier sells: ")
                print("1 - Dairy")
                print("2 - Beverages")
                print("3 - Ingredients")
                print("4 - Finish adding products")
                
                var option = readLine()
                let firstDigit = option?.first
                
                
                switch firstDigit {
                    case "1": productType.append(.Dairy)
                    case "2": productType.append(.Beverages)
                    case "3": productType.append(.Ingredients)
                    case "4": isAddingProducts = false
                    default: print("Invalid option. Please try again.")
                }
            }
            
            var supplier : Supplier = Supplier(name: name, productType: productType)
            suppliers.append(supplier)
            
        } else {
            print("Invalid name!")
            Thread.sleep(forTimeInterval: 3)
            registerSupplier()
        }
        
    }

    func buyProduct() {
        print
    }
}

struct Products: Hashable {
    var name : String
    var type : ProductType
    var costs : Double
    var price : Double
    var origin : Origin 
}
