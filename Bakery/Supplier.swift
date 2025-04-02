//
//  Supplirer.swift
//  Bakery
//
//  Created by aluno-111 on 01/04/25.
//

class Supplier {
    var name: String
    var productTypes: [ProductType] 
    
    init(name: String, productTypes: [ProductType]) {
        self.name = name
        self.productTypes = productTypes
    }
}
