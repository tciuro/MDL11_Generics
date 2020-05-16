//
//  CellConfigurator.swift
//  TableTest
//
//  Created by Igors Nemenonoks on 30/08/2017.
//  Copyright © 2017 Chili. All rights reserved.
//

import UIKit

protocol ConfigurableCell {
    associatedtype ItemType
    func configure(item: ItemType)
}

protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView)
}

class TableCellConfigurator<CellType: ConfigurableCell, ItemType>: CellConfigurator where CellType.ItemType == ItemType, CellType: UITableViewCell {
    
    static var reuseId: String { return String(describing: CellType.self) }
    
    let item: ItemType
    
    init(item: ItemType) {
        self.item = item
    }
    
    func configure(cell: UIView) {
        (cell as! CellType).configure(item: item)
    }
}
