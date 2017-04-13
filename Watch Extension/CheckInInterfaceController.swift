//
//  CheckInInterfaceController.swift
//  AirAber
//
//  Created by Özgün Emre Zor on 11/04/2017.
//  Copyright © 2017 Mic Pringle. All rights reserved.
//

import WatchKit
import Foundation


class CheckInInterfaceController: WKInterfaceController {
    
    @IBOutlet var backgroundGroup: WKInterfaceGroup!
    @IBOutlet var originLabel: WKInterfaceLabel!
    @IBOutlet var destinationLabel: WKInterfaceLabel!
    
    var flight: Flight? {
        didSet {
            if let flight = flight {
                originLabel.setText(flight.origin)
                destinationLabel.setText(flight.destination)
            }
        }
    }

    @IBAction func checkInButtonTapped() {
        
        let duration = 0.35
        
        backgroundGroup.setBackgroundImageNamed("Progress")
        
        backgroundGroup.startAnimatingWithImages(in: NSMakeRange(0, 10), duration: duration, repeatCount: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            self.flight?.checkedIn = true
            self.dismiss()
        }
        
    }
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let flight = context as? Flight { self.flight = flight }
    }


    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
