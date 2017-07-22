//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by 宋 奎熹 on 2017/7/17.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate {
    
    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet var stopButton: NSButton!
    @IBOutlet var speakButton: NSButton!
    @IBOutlet var progressIndicator: NSProgressIndicator!
    
    override func viewDidLoad() {
        speechSynthesizer.delegate = self
        setIsSpeaking(isSpeaking: false)
    }
    
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue ?? ""
        }
    }
    
    @IBAction func speakButtonClicked(_ sender: NSButton) {
        setIsSpeaking(isSpeaking: true)
        let contents = textView.string
        speechSynthesizer.startSpeaking(contents)
    }
    
    @IBAction func stopButtonClicked(_ sender: NSButton) {
        setIsSpeaking(isSpeaking: false)
        speechSynthesizer.stopSpeaking()
    }
    
    func setIsSpeaking(isSpeaking: Bool) {
        speakButton.isEnabled = !isSpeaking
        stopButton.isEnabled = isSpeaking
        progressIndicator.isHidden = !isSpeaking
    }
    
    func speechSynthesizer(_: NSSpeechSynthesizer, didFinishSpeaking: Bool) {
        setIsSpeaking(isSpeaking: false)
    }
    
    func speechSynthesizer(_ sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, of string: String) {
        let pc = Double(characterRange.location + characterRange.length) / Double(string.characters.count)
        progressIndicator.doubleValue = (pc * 100)
    }
    
}

