//
//  GroceryModel.swift
//  GroceryCheck
//
//  Created by David Mclean on 6/30/23.
//

import Foundation
import SwiftData

@Model
final class GroceryModel {
    @Attribute(.unique) var id: UUID
    var itemName : String
    var checkStatus: Bool
    
    init(id: UUID, item: String, checkStatus: Bool) {
        self.id = id
        itemName = item
        self.checkStatus = checkStatus
    }
}
