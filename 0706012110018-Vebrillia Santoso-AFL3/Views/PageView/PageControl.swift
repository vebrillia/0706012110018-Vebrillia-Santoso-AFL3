//
//  PageControl.swiift.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    //method to create and return a new coordinator
    func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        //add the coordinator as the target for value changed event
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
           var control: PageControl

           init(_ control: PageControl) {
               self.control = control
           }

           @objc
           func updateCurrentPage(sender: UIPageControl) {
               control.currentPage = sender.currentPage
           }
       }
}
