//
//  ViewController.swift
//  Map
//
//  Created by 유저 on 2021. 2. 8..
//  Copyright © 2021년 net.macnpc. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func goLocation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpanMake(span, span)
        let pRegion = MKCoordinateRegionMake(pLocation, spanValue)
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    // 원하는 위치 두곳에 핀 설치하기
    func setAnnotation(latitude latitudeValue: CLLocationDegrees, longitude longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let pLocation = locations.last
        goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // 현재 위치 표시
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
            
        } else if sender.selectedSegmentIndex == 1 {
            // 성공회대학교 표시
            setAnnotation(latitude: 37.48765257812031, longitude: 126.82564458010627, delta: 1, title: "성공회대학교", subtitle: "서울 구로구 항동 1-1")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "성공회대학교"
            
        } else if sender.selectedSegmentIndex == 2 {
            // 네이버 본사 표시
            //37.359519817866826
            //127.10497698325682
            setAnnotation(latitude: 37.359519817866826, longitude: 127.10497698325682, delta: 1, title: "네이버 본사", subtitle: "경기도 성남시 분당구 불정로 6")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "네이버 본사"
        } else if sender.selectedSegmentIndex == 3 {
            // 다음 본사 표시
            //33.450565560620475
            //126.57067263360018
            setAnnotation(latitude: 33.450565560620475, longitude: 126.57067263360018, delta: 1, title: "다음 본사", subtitle: "제주특별자치도 제주시 첨단로 242")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "다음 본사"
        }
        
        
    }

}

