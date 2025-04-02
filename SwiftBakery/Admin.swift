import Foundation

class Admin: User {
    var suppliers: [Supplier] = []
    override var userType: UserType {
        get {
            return .admin
        }
        set {
            super.userType = newValue
        }
    }

    func showAdminMenu() {
        print("\nChoose an option:")
        print("1 - Register supplier")
        print("2 - Create new attendant account")
        print("3 - Delete attendant account")
        print("4 - Check attendant account")
        print("5 - Print sales report")
        print("6 - Buy products")
        print("7 - Produce items")
        print("8 - Exit")

        let option = readLine()
        let firstDigit = option?.first

        switch firstDigit {
        case "1": registerSupplier()
        case "2": createAttendantAccount()
        case "3": deleteAttendantAccount()
        case "4": checkAttendantAccount()
        case "5": printSalesReport()
        case "6": buyProducts()
        case "7": produceItems()
        case "8": Bakery.login()
        default: showAdminMenu()
        }

    }

    func createAttendantAccount() {
        print("Enter attendant's username: ")
        var username = readLine()
        var password: String?

        if let username = username {
            for user in Bakery.users {
                if username == user.username {
                    print("Username already exists! Choose another username.")
                    Thread.sleep(forTimeInterval: 3)
                    createAttendantAccount()

                } else {
                    repeat {
                        print("Enter a new password for the attendant: ")

                        password = readLine()

                        if let password = password {
                            let attendant: User = User(
                                username: username, password: password,
                                userType: .attendant)
                            Bakery.users.append(attendant)
                            print("\nUser succesfully created")
                            break
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

    func deleteAttendantAccount() {
        print("Enter the username of the attendant you want to delete: ")
        var username = readLine()

        if let username = username {
            for user in Bakery.users {
                if username == user.username {
                    if user.userType == .attendant {
                        print("Attendant account deleted!")
                        Bakery.users.removeAll(where: {
                            $0.username == username
                        })
                    } else {
                        print("This user is not an attendant!")
                    }
                } else {
                    print("User not found!")
                }
            }
        } else {
            print("Invalid username!")
            Thread.sleep(forTimeInterval: 3)
            deleteAttendantAccount()
        }
        showAdminMenu()
    }

    func checkAttendantAccount() {
        print("Enter the username of the attendant you want to check: ")
        var username = readLine()

        if let username = username {
            for user in Bakery.users {
                if username == user.username {
                    if user.userType == .attendant {
                        print("Attendant account found!")
                        print("Username: \(user.username)")
                        print("Password: \(user.password)")
                    } else {
                        print("This user is not an attendant!")
                    }
                } else {
                    print("User not found!")
                }
            }
        } else {
            print("Invalid username!")
            Thread.sleep(forTimeInterval: 3)
            checkAttendantAccount()
        }
        showAdminMenu()
    }

    func registerSupplier() {
        print("\nEnter supplier name: ")
        var name = readLine()

        if let name = name {
            var productType: [ProductType] = []
            var isAddingProducts = true
            while isAddingProducts {
                print("\nEnter the product type this supplier sells: ")
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

            var supplier: Supplier = Supplier(
                name: name, productTypes: productType)
            suppliers.append(supplier)

        } else {
            print("Invalid name!")
            Thread.sleep(forTimeInterval: 3)
            registerSupplier()
        }
        showAdminMenu()
    }

    func buyProducts() {
    }

    func printSalesReport() {

    }
    func produceItems(){
        
    }

}
