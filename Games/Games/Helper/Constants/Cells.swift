//
//  Cells.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

struct TableCells {
    struct Header {
        static public let table = "HeaderTableCell"
    }

    struct Cell {
        static public let game = "GameTableCell"
        static public let banner = "BannerTableCell"
        static public let description = "DescriptionTableCell"
        static public let info = "InfoTableCell"
        static public let publisher = "PublisherTableCell"
        static public let empty = "EmptyTableCell"
    }
}

struct CollectionCells {
    struct Cell {
        static public let publisher = "PublisherItemCollectionCell"
    }
}
