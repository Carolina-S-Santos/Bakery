//
//  Supplirer.swift
//  Bakery
//
//  Created by aluno-111 on 01/04/25.
//

enum ProductType {
    case Pastries, Cakes, Dairy, Bread
}

class Supplier {
    var name : String
    var productType : ProductType
    
    init (name: String, productType: ProductType){
        self.name = name
        self.productType = productType
    }
    
}
