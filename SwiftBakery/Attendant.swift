

class Attendant : User {
    
    override var userType: UserType {
            get {
                return .attendant  
            }
            set {
                super.userType = newValue
            }
        }
    var sales : [Product] = []
    
    func showAttendantMenu(){
        print("Choose an option:")
        print("1 - Check storage")
        print("2 - Make a sale")
        print("3 - Exit")
        
        let option = readLine()
        let firstDigit = option?.first
        
        
        switch firstDigit {
        case "1": checkStorage(stock: Bakery.stock)
            case "2": makeSale()
//            case "3": bakery.login()
            default: showAttendantMenu()
        }
        
    }


    func checkStorage(stock : [Product: Int] ){
        print("\nEstoque: ")
        for (product, amount) in stock {
            print("\(product.name): \(amount)")
        }
    }
    
    func makeSale(){
        
    }

    func printSalesReport(){
        
    }
}
