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

class Bakery {
    
    var stock : [Products: Int] = [:]
//    var loggedUser : ?
    
//    stock --> dictionary
    // [funcionarios]
    // [fornecedores]
    // loggedUser
   

//    let superAdmin : User =
    var users : [User]
    var suppliers : [Supplier] = []

    
    init() {
        users = MockData.users()
//        stock = [:]
        
//        login()
        
    }
    
    func login(){
        for user in users {
            print(user.username, user.password, user.userType)
        }
        print("Swift Bakery")
        print("Enter your username: ")
        var username = readLine()
        
        //Checa se o usuário já existe
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
            print("Enter the product type this supplier sells: ")
            print("Choose an option:")
            print("1 - Pastries")
            print("2 - Cakes")
            print("3 - Dairy")
            print("4 - Bread")
            print("5 - Return")
            
            var option = readLine()
            var productType : ProductType = .Bread
            
            switch option {
                case "1": productType = .Pastries
                case "2": productType = .Cakes
                case "3": productType = .Dairy
                case "4": productType = .Bread
                default: registerSupplier()
            }
            var supplier : Supplier = Supplier(name: name, productType: productType)
            suppliers.append(supplier)
            
        } else {
            print("Invalid name!")
            Thread.sleep(forTimeInterval: 3)
            registerSupplier()
        }
        
    }

    func createAttendantAccount(){
        print("Enter attendant's username: ")
        var username = readLine()
        var password : String?
        
        if let username = username {
            for user in users{
                if username == user.username {
                    print("Username already exists! Choose another username.")
                    Thread.sleep(forTimeInterval: 3)
                    createAttendantAccount()
                    
                } else {
                    repeat {
                        print("Enter a new password for the attendant: ")
                        
                        password = readLine()
                        
                        if let password = password{
                            let attendant : User = User(username: username, password: password, userType: .attendant)
                            users.append(attendant)
                        } else {
                            print("Invalid password!")
                        }
                    } while password == nil
                }
            }
            
        } else {
            print("Invalid username!")
            Thread.sleep(forTimeInterval: 3)
            createAttendantAccount()
        }
    }


}


struct Products: Hashable {
    var name : String
    var type : ProductType
    var costs : Double
    var price : Double
    var origin : String
    
}
