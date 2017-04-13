//
//  BoardingPassInterfaceController.swift
//  AirAber
//
//  Created by Özgün Emre Zor on 12/04/2017.
//  Copyright © 2017 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class BoardingPassInterfaceController: WKInterfaceController {
    
    var session: WCSession? {
        didSet {
            if let session = session  {
                session.delegate = self as! WCSessionDelegate
                session.activate()
            }
        }
    }
    
    @IBOutlet var originLabel: WKInterfaceLabel!
    @IBOutlet var destinationLabel: WKInterfaceLabel!
    @IBOutlet var boardingPassImage: WKInterfaceImage!
    
    var flight: Flight? {
        didSet {
            if let flight = flight {
                originLabel.setText(flight.origin)
                destinationLabel.setText(flight.destination)
            }
        }
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let flight = context as? Flight { self.flight = flight }
    }

    private func showBoardingPass() {
        boardingPassImage.stopAnimating()
        boardingPassImage.setWidth(120)
        boardingPassImage.setHeight(120)
        boardingPassImage.setImage(flight?.boardingPass)
    }

}

//extension BoardingPassInterfaceController: WCSessionDelegate {
//
//}
