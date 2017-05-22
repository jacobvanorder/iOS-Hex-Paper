//
//  HexGrid.swift
//  Hex Paper
//
//  Created by Michael Johnson on 5/16/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import Foundation

struct HexGrid {
    let edges: Set<Set<Vertex>>
    
    init(rows: Int, columns: Int, hexRadius: Double) {
        
        let lattice = TriangularLattice(edgeLength: hexRadius)
        let firstHexEdges = HexGrid.edgesForHexWith(centerVertexRow: 1, centerVertexColumn: 1, with: lattice)
        var secondHexEdges: Set<Set<Vertex>> = Set()
        if rows != 1 || columns != 1 {
            secondHexEdges = HexGrid.edgesForHexWith(centerVertexRow: 2,
                                                     centerVertexColumn: 2,
                                                     with: lattice)
        }
        edges = firstHexEdges.union(secondHexEdges)
    }

    static func edgesForHexWith(centerVertexRow: Int,
                                centerVertexColumn: Int,
                                with lattice: TriangularLattice) -> Set<Set<Vertex>> {

        var columnOffset = 0
        if centerVertexRow % 2 == 0 {
            columnOffset = 1
        }
        
        let leftVertex = lattice.vertexAt(row: centerVertexRow, column: centerVertexColumn - 1)
        let topLeftVertex = lattice.vertexAt(row: centerVertexRow - 1, column: centerVertexColumn - 1 + columnOffset)
        let topRightVertex = lattice.vertexAt(row: centerVertexRow - 1, column: centerVertexColumn + columnOffset)
        let bottomLeftVertex = lattice.vertexAt(row: centerVertexRow + 1, column: centerVertexColumn - 1 + columnOffset)
        let bottomRightVertex = lattice.vertexAt(row: centerVertexRow + 1, column: centerVertexColumn + columnOffset)
        let rightVertex = lattice.vertexAt(row: centerVertexRow, column: centerVertexColumn + 1)
        
        return Set( [Set( [leftVertex, topLeftVertex]),
                     Set( [topLeftVertex, topRightVertex]),
                     Set( [topRightVertex, rightVertex]),
                     Set( [leftVertex, bottomLeftVertex]),
                     Set( [bottomLeftVertex, bottomRightVertex]),
                     Set( [bottomRightVertex, rightVertex]),
                     ])
    }
}
