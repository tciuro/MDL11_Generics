//
//  Data.swift
//  TableTest
//
//  Created by Igors Nemenonoks on 27/08/2017.
//  Copyright © 2017 Chili. All rights reserved.
//

import UIKit

class User: Base {
    init(name: String, imageName: String) {
        super.init(image: UIImage(named: imageName), text: name, detail: nil)
    }
}
