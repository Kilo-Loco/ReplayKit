//
//  ViewController.swift
//  Instant Replay
//
//  Created by Kyle Lee on 5/28/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import UIKit
import ReplayKit

class ViewController: UIViewController {

    let recorder = RPScreenRecorder.shared()
    
    
    @IBAction func onRecordTapped(_ sender: Any) {
        
        recorder.startRecording { (error) in
            if let error = error {
                print(error)
            }
        }
    }
    
    
    @IBAction func onStopTapped(_ sender: Any) {
        recorder.stopRecording { (previewVC, error) in
            if let previewVC = previewVC {
                previewVC.previewControllerDelegate = self
                self.present(previewVC, animated: true, completion: nil)
            }
            
            if let error = error {
                print(error)
            }
        }
    }
}

extension ViewController: RPPreviewViewControllerDelegate {
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
        dismiss(animated: true, completion: nil)
    }
}




