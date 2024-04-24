//
//  Router.swift
//  viperexample
//
//  Created by Victor Manuel Lagunas on 2024/04/24.
//

import Foundation
import UIKit

// router
// object
// entry point

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get set }
    static func start() -> AnyRouter
}

class UserRouter: AnyRouter {
    var entry: (any EntryPoint)?
    
    static func start() -> any AnyRouter {
        let router = UserRouter()
     
        // Assign VIP
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
}
