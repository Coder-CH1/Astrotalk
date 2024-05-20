//
//  CallsViewController.swift
//  Astrotalk
//
//  Created by Mac on 19/05/2024.
//

import UIKit
import CallKit

class CallsViewController: UIViewController {
    
    let callManager = CallManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startCall()
    }
    func startCall() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            let id = UUID()
            self.callManager.reportIncomingCalls(id: id, handle: "Astrologer")
        })
    }
}
                                      
