//
//  Protocols.swift
//  expensesApp
//
//  Created by Lautaro Pinto on 21/02/2021.
//

import UIKit

/// Provides information to execute a request.
internal protocol RequestProviding {
    var urlRequest: URLRequest { get }
}

/// Provides a networkig layer
internal protocol NetworkingProtocol {
    /**
     Performs an API call.
     - parameter requestProvider: A valid `RequestProviding`. Will contain the API call information.
     - parameter completion: A valid `(Result<T, Error>) -> Void` completion closure. The API call result will trigger the completion.
     */
    func execute<T: Decodable>(_ requestProvider: RequestProviding,
                               completion: @escaping (Result<T, Error>) -> Void)
}

/// Provides a navigation abstraction.
internal protocol NavigatorProtocol {
    func push(_ viewController: UIViewController, animated: Bool)
    func popToRoot(animated: Bool)
    func pop(animated: Bool)
    func setRoot(_ viewController: UIViewController)
}
