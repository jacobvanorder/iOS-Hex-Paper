//
//  DocumentsControllerTests.swift
//  Hex Paper
//
//  Created by Michael Johnson on 4/11/17.
//  Copyright © 2017 Michael Johnson. All rights reserved.
//

import XCTest
@testable import Hex_Paper

class FakeModel: ModelLayerProtocol {
    var createDocumentWasCalled = false
    func createDocument() {
        createDocumentWasCalled = true
    }
}

class FakeDocumentsViewController: DocumentsViewControllerProtocol {
    
}

class DocumentsControllerTests: XCTestCase {
    var fakeModel: FakeModel!
    var fakeViewController: FakeDocumentsViewController!
    var SUT: DocumentsController!
    
    override func setUp() {
        super.setUp()
        fakeModel = FakeModel()
        fakeViewController = FakeDocumentsViewController()
        SUT = DocumentsController(model: fakeModel)
    }
    
    func testDocumentsController() {
        let SUT = DocumentsController()
        
        XCTAssertNotNil(SUT)
    }
    
    func testModel() {
        let fakeModel = FakeModel()
        let SUT = DocumentsController(model: fakeModel)
        
        XCTAssert(SUT.model as? FakeModel === fakeModel)
    }
    
    func testDocumentsViewControllerAddButtonWasTapped() {
        SUT.documentsViewControllerAddButtonWasTapped(fakeViewController)
        
        XCTAssert(fakeModel.createDocumentWasCalled)
        
    }
}
