//
//  TableCells.swift
//  TableTest
//
//  Created by Igors Nemenonoks on 27/08/2017.
//  Copyright © 2017 Chili. All rights reserved.
//

import UIKit

class BaseCell<ItemType: Base>: UITableViewCell, ConfigurableCell {
    func configure(item: ItemType) {
        imageView?.image = item.image
        textLabel?.text = item.text
        detailTextLabel?.text = item.detail
    }
}

class Base {
    let image: UIImage?
    let text: String?
    let detail: String?
    
    init(image: UIImage?, text: String?, detail: String?) {
        self.image = image
        self.text = text
        self.detail = detail
    }
}


class UserCell: BaseCell<User> {
    override func configure(item user: User) {
        super.configure(item: user)
    }
}


class MessageCell: BaseCell<Base> {
    override func configure(item: Base) {
        super.configure(item: item)
    }
}


class ImageCell: BaseCell<Base> {
    override func configure(item: Base) {
            super.configure(item: item)
    }
}

class WarningCell: BaseCell<Base> {
    override func configure(item: Base) {
        super.configure(item: item)
    }
}
