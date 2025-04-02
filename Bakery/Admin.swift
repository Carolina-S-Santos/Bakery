class Admin : User {
    var userType : UserType = .admin
    
    init(username: String, password: String) {
        super.init(username: username, password: password, userType: .admin)
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

    func deleteAttendantAccount(){
        print("Enter the username of the attendant you want to delete: ")
        var username = readLine()

        if let username = username {
            for user in users {
                if username == user.username {
                    if user.userType == .attendant {
                        print("Attendant account deleted!")
                        users.removeAll(where: { $0.username == username })
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
    }

    func checkAttendantAccount(){
        print("Enter the username of the attendant you want to check: ")
        var username = readLine()

        if let username = username {
            for user in users {
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
    }

    func printSalesReport(){
        
    }
    
}
