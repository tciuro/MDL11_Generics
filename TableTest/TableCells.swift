//
//  TableCells.swift
//  TableTest
//
//  Created by Igors Nemenonoks on 27/08/2017.
//  Copyright © 2017 Chili. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell, ConfigurableCell {
    func configure(item: Base) {
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


class UserCell: BaseCell {}

class MessageCell: UITableViewCell, ConfigurableCell {
    @IBOutlet weak var messageLabel: UILabel!

    func configure(item message: String) {
        messageLabel.text = message
    }
}


class ImageCell: UITableViewCell, ConfigurableCell {
    @IBOutlet weak var pictureView: UIImageView!

    func configure(item url: URL) {
        if let data = try? Data(contentsOf: url) {
            self.pictureView.image = UIImage(data: data)
        }
    }
}

class WarningCell: UITableViewCell, ConfigurableCell {
    @IBOutlet weak var messageLabel: UILabel!
    
    func configure(item message: String) {
        messageLabel.text = message
    }
}
