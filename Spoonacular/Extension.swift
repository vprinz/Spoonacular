//
//  Extension.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 04/08/2024.
//

import SwiftUI


extension String {
    func htmlToString() -> String {
        return  try! NSAttributedString(
            data: self.data(using: .utf8)!,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        ).string
    }
}
