//
//  TableViewModel.swift
//  TableTest
//
//  Created by Igors Nemenonoks on 27/08/2017.
//  Copyright © 2017 Chili. All rights reserved.
//

import UIKit

typealias UserCellConfig = TableCellConfigurator<UserCell, User>
typealias MessageCellConfig = TableCellConfigurator<MessageCell, Base>
typealias ImageCellConfig = TableCellConfigurator<ImageCell, Base>
typealias WarningCellConfig = TableCellConfigurator<WarningCell, Base>

class TableViewModel {
    let url = Bundle.main.url(forResource: "beach@2x", withExtension: "jpg")!
    let data = try? Data(contentsOf: Bundle.main.url(forResource: "beach@2x", withExtension: "jpg")!)
    let items: [CellConfigurator]
    
    init() {
        self.items = [
            UserCellConfig(item: User(name: "John Smith", imageName: "user3")),
            
            MessageCellConfig(item: Base(image: nil, text: "Hi, this is a message text. Tra la la. Tra la la.",detail: nil)),
            ImageCellConfig(item: Base(image: UIImage(data: data!), text: nil, detail: nil)),
            UserCellConfig(item:User(name: "Jessica Wood", imageName: "user2")),
            MessageCellConfig(item: Base(image: nil, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", detail: nil)),
            MessageCellConfig(item: Base(image: nil, text: "Hey!! It's a warning!!!!",detail: nil)),
        ]
    }

}
