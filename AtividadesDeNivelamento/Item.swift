//
//  Item.swift
//  AtividadesDeNivelamento
//
//  Created by CICERO DIOGO LEMOS DA SILVA on 23/04/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
