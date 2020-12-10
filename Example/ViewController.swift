//
//  ViewController.swift
//  ALCameraViewController
//
//  Created by Alex Littlejohn on 2015/06/17.
//  Copyright (c) 2015 zero. All rights reserved.
//

import UIKit
import CoreML
import Vision

@available(iOS 13.0, *)


class ViewController: UIViewController {
    
    //     Prepare the model and request
    
    var image: UIImage!
    var modelImage: CIImage!
    var model: VNCoreMLModel!
    var request: VNCoreMLRequest!


    var minimumSize: CGSize = CGSize(width: 60, height: 60)

    var croppingParameters: CroppingParameters {
        return CroppingParameters(isEnabled: false, allowResizing: false, allowMoving: false, minimumSize: minimumSize)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var croppingParametersView: UIView!
    @IBOutlet weak var minimumSizeLabel: UILabel!
    @IBOutlet weak var librarySwitch: UISwitch!
    @IBOutlet weak var croppingSwitch: UISwitch!
    @IBOutlet weak var resizableSwitch: UISwitch!
    @IBOutlet weak var movableSwitch: UISwitch!
    @IBOutlet weak var confidence: UILabel!
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var libraryButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.imageView.contentMode = .scaleAspectFit
        
        classificationLabel.layer.masksToBounds = true
        classificationLabel.layer.cornerRadius = 8
        cameraButton.layer.masksToBounds = true
        cameraButton.layer.cornerRadius = 8
        libraryButton.layer.masksToBounds = true
        libraryButton.layer.cornerRadius = 8
        
        do {
            try model = try? VNCoreMLModel(for: SavedModel().model)
            request = VNCoreMLRequest(model: model) { (finishReq, err) in
                self.processClassifications(for: finishReq, error: err)
            }
        
        } catch {
            print("Invalid Selection.")
        }

        
    }
    
   
    func processClassifications(for request: VNRequest, error: Error?) {
        DispatchQueue.main.async {
            guard let results = request.results else {
                self.classificationLabel.text = "Unable to classify image.\n\(error!.localizedDescription)"
                return
            }
            let classifications = results as! [VNClassificationObservation]

            if classifications.isEmpty {
                self.classificationLabel.text = "Nothing recognized."
            } else {
                /* Display top classifications ranked by confidence in the UI. */
                let topClassifications = classifications.prefix(1)
                self.classificationLabel.text = topClassifications[0].identifier
                self.confidence.text = String(format:"%.2f", Double(topClassifications[0].confidence) * 100) + " %"
                }
            }
    }
    
    @IBAction func openCamera(_ sender: Any) {
        let cameraViewController = CameraViewController(croppingParameters: croppingParameters, allowsLibraryAccess: false) { [weak self] image, asset in
            if let image = image{
                self?.image = image
                self?.imageView.image = image
                self?.modelImage = CIImage(image: image)
                
                if let mImage = self?.modelImage, let req = self?.request{
                    try? VNImageRequestHandler(ciImage: mImage ).perform([req])
                }
                
                
            }
           
            
            self?.dismiss(animated: true, completion: nil)
            
            
        }
        
        
        present(cameraViewController, animated: true, completion: nil)
    }
    
    @IBAction func openLibrary(_ sender: Any) {
        let libraryViewController = CameraViewController.imagePickerViewController(croppingParameters: croppingParameters) { [weak self] image, asset in
            if let image = image{
                self?.image = image
                self?.imageView.image = image
                self?.modelImage = CIImage(image: image)
                
                if let mImage = self?.modelImage, let req = self?.request{
                    try? VNImageRequestHandler(ciImage: mImage ).perform([req])
                }
                
                
            }
            self?.dismiss(animated: true, completion: nil)
        }
        
        present(libraryViewController, animated: true, completion: nil)
    }
    
//    @IBAction func croppingChanged(_ sender: UISwitch) {
//        croppingParametersView.isHidden = !sender.isOn
//    }

    @IBAction func minimumSizeChanged(_ sender: UISlider) {
        let newValue = sender.value
        minimumSize = CGSize(width: CGFloat(newValue), height: CGFloat(newValue))
        minimumSizeLabel.text = "Minimum size: \(newValue.rounded())"
    }
//    func processClassifications(for request: VNRequest, error: Error?) {
//        DispatchQueue.main.async {
//            guard let results = request.results else {
//                self.classificationLabel.text = "Unable to classify image.\n\(error!.localizedDescription)"
//                return
//            }
//            let classifications = results as! [VNClassificationObservation]
//
//            if classifications.isEmpty {
//                self.classificationLabel = "Nothing recognized."
//            } else {
//                /* Display top classifications ranked by confidence in the UI. */
//                let topClassifications = classifications.prefix(1)
//                self.classificationLabel = topClassifications[0].identifier
//                self.confidence = topClassifications[0].confidence
//                }
//            }
//    }
        
}

