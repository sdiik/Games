//
//  StringExtension.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

extension String{
    var htmlStripped: String{
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
