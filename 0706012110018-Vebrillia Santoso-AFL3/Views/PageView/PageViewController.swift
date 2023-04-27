//
//  PageViewController.swift
//  0706012110018-Vebrillia Santoso-AFL3
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    //another method to make the coordinator
    func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }
    
    //configuration UIPageViewController
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        //add the coordinator as the data source
        pageViewController.dataSource = context.coordinator

        return pageViewController
    }
    
    //provide a view controller for display
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            //initialize array
            [context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        // implement 2 required method
        func pageViewController(
                    _ pageViewController: UIPageViewController,
                    viewControllerBefore viewController: UIViewController) -> UIViewController?
                {
                    guard let index = controllers.firstIndex(of: viewController) else {
                        return nil
                    }
                    if index == 0 {
                        return controllers.last
                    }
                    return controllers[index - 1]
                }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
    }
}

