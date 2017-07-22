//
//  Document.swift
//  VocalTextEdit
//
//  Created by 宋 奎熹 on 2017/7/17.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    var contents: String = ""

    enum Error: Swift.Error, LocalizedError {
        case UTF8Encoding
        case UTF8Decoding
        
        var failureReason: String? {
            switch self {
            case .UTF8Encoding:
                return "File cannot be encoded in UTF-8"
            case .UTF8Decoding:
                return "File is not valid in UTF-8"
            }
        }
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        
        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = contents
        
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        let content = viewController.contents ?? ""
        
        guard let data = content.data(using: .utf8) else {
            throw Document.Error.UTF8Encoding
        }
        return data
    }

    override func read(from data: Data, ofType typeName: String) throws {
        guard let content = String(data: data, encoding: .utf8) else {
            throw Document.Error.UTF8Decoding
        }
        
        self.contents = content
    }
    
}

