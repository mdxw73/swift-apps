//
//  ViewController.swift
//  MachineLearning
//
//  Created by Zack Obied on 11/03/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController {
    
    @IBOutlet var cameraButton: UIButton!
    @IBOutlet var photosButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var resultsLabel: UILabel!
    
    var firstTime = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        resultsLabel.text = "choose or take a photo"
        resultsLabel.layer.masksToBounds = true
        resultsLabel.layer.cornerRadius = 5
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if firstTime {
            showResultsView(delay: 2)
            firstTime = false
        }
    }
    
    @IBAction func takePicture(_ sender: Any) {
        presentPhotoPicker(sourceType: .camera)
    }
    
    @IBAction func choosePhoto(_ sender: Any) {
        presentPhotoPicker(sourceType: .photoLibrary)
    }
    
    lazy var classificationRequest: VNCoreMLRequest = {
        let visionModel = try! VNCoreMLModel(for: SqueezeNet().model)
        let request = VNCoreMLRequest(model: visionModel) { [unowned self] request, _ in
            self.processObservations(for: request)
        }
        request.imageCropAndScaleOption = .centerCrop
        return request
    } ()
    
    func presentPhotoPicker(sourceType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker, animated: true)
    }
    
    func showResultsView(delay: TimeInterval = 0.1) {
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 1, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .beginFromCurrentState, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func classify(image: UIImage) {
        DispatchQueue.global(qos: .userInitiated).async {
            let ciImage = CIImage(image: image)!
            let orientation = CGImagePropertyOrientation(rawValue: UInt32(image.imageOrientation.rawValue))!
            let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
            try! handler.perform([self.classificationRequest])
        }
    }
    
    func processObservations(for request: VNRequest) {
        DispatchQueue.main.async {
            let result = request.results!.first as! VNClassificationObservation
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = 1
            let confidencePrecentage = formatter.string(from: result.confidence * 100 as NSNumber)!
            self.resultsLabel.text = "\(result.identifier): \(confidencePrecentage)%"
            self.showResultsView()
        }
    }
    
}
    
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
    
    let image = info[.originalImage] as! UIImage
        imageView.image = image
        classify(image: image)
    }
}
