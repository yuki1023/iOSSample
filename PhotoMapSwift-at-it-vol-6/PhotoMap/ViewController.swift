//
//  ViewController.swift
//  PhotoMap
//
//  Created by 平屋真吾 on 2014/11/25.
//  Copyright (c) 2014年 Shingo Hiraya. All rights reserved.
//

import UIKit
import MapKit
import Photos

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.prepareMapView()
        self.checkAuthorizationStatus()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let identifier = segue.identifier {
                   if identifier == "assetViewControllerSegue" {
                       let annotationView = sender as! MKAnnotationView
                       
                       let assetViewController = segue.destination as! AssetViewController
                       assetViewController.annotation = annotationView.annotation as? PhotoAnnotation
                   }
               }
    }
       
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        let photoAnnotation = annotation as? PhotoAnnotation
        let photoAnnotationViewID = "photoAnnotationView"
        var photoAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: photoAnnotationViewID) as? PhotoAnnotationView
        
        if photoAnnotationView == nil {
            photoAnnotationView = PhotoAnnotationView(annotation: photoAnnotation, reuseIdentifier: photoAnnotationViewID)
        }
        
        if let image = photoAnnotation?.image {
            photoAnnotationView?.image = image
        } else {
            let screenScale = UIScreen.main.scale
            let targetSize = CGSize(
                width: PhotoAnnotationView.size.width * screenScale,
                height: PhotoAnnotationView.size.height * screenScale)
            
            PHImageManager().requestImage(
                for: (photoAnnotation?.asset)!,
                targetSize: targetSize,
                contentMode: .aspectFill,
                options: nil,
                resultHandler: {(image, info) -> Void in
                    photoAnnotation?.image = image;
                    photoAnnotationView?.thumbnailImage = image;
                }
            )
        }
        
        return photoAnnotationView
    }
    
    func mapView(mapView: MKMapView!, didSelectAnnotationView view: MKAnnotationView!) {
        let coordinate :CLLocationCoordinate2D = view.annotation!.coordinate
        var region :MKCoordinateRegion = mapView.region
        region.center = coordinate
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        self.performSegue(withIdentifier: "assetViewControllerSegue", sender: view)
    }
    
    private func prepareMapView() {
        self.mapView.isRotateEnabled = false
        self.mapView.isPitchEnabled = false
        self.mapView.delegate = self
        
        let centerCoordinate = CLLocationCoordinate2D(latitude: 35.681382, longitude: 139.766084)
        let initialSpan = MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4)
        let initialRegion = MKCoordinateRegion(center: centerCoordinate, span: initialSpan)
        self.mapView.setRegion(initialRegion, animated: true)
    }
    
    private func checkAuthorizationStatus() {
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case .authorized:
            self.prepareAnnotations()
        default:
            PHPhotoLibrary.requestAuthorization{ status in
                if status == .authorized {
                    self.prepareAnnotations()
                }
            }
        }
    }
    
    private func prepareAnnotations() {
        let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
        fetchResult.enumerateObjects ({result, index, stop in
            
            if let asset = result as? PHAsset {
                if asset.location != nil {
                    let annotation = PhotoAnnotation(asset: asset)
                    self.mapView.addAnnotation(annotation)
                }
            }
        })
    }
}

