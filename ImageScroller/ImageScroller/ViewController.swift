//
//  ViewController.swift
//  ImageScroller
//
//  Created by toaster on 2021/09/04.
//

import UIKit

final class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
    }
    
    func updateMinZoomScaleForSize(_ size:CGSize){
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = minScale
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    func updateConstraintsForSize(_ size:CGSize){
        let yOffset = max(0,(size.height - imageView.frame.height) / 2)
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: yOffset)
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: yOffset)
        
        let xOffset = max(0,(size.width - imageView.frame.width) / 2)
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: xOffset)
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: xOffset)
        
        view.layoutIfNeeded()
    }
}

