class Attendant : User {
    var userType : UserType = .attendant
    var sales : [Bakery.Products] = []

    init(username: String, password: String, userType: UserType) {
        super.init(username: username, password: password, userType: userType)
    }

    func checkStorage(){
        
    }
    func makeSale(){
        
    }

    func printSalesReport(){
        
    }
}