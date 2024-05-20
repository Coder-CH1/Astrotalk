//
//  LiveViewController.swift
//  Astrotalk
//
//  Created by Mac on 13/04/2024.
//

import UIKit
import AVFoundation

//MARK: -
class LiveViewController: UIViewController {

    var captureSession = AVCaptureSession()
    var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer?
    var movieFileOutput = AVCaptureMovieFileOutput()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupCaptureSession() {
        guard let videoInput = try? AVCaptureDeviceInput(device: AVCaptureDevice.default(for: .video)!) else { return }
        captureSession.addInput(videoInput)
        
        guard let audioInput = try? AVCaptureDeviceInput(device: AVCaptureDevice.default(for: .audio)!) else {return}
        captureSession.addInput(audioInput)
        
        captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        captureVideoPreviewLayer?.frame = view.bounds
        captureVideoPreviewLayer?.videoGravity = .resizeAspectFill
        view.layer.addSublayer(captureVideoPreviewLayer!)
        captureSession.addOutput(movieFileOutput)
        
        captureSession.startRunning()
    }
    
    func startStreaming() {
    }
}
