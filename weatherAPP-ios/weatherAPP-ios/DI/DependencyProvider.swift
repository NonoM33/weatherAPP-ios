//
//  DependencyProvider.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
//

import Foundation
import Swinject

// swiftlint:disable force_unwrapping
public class DependencyProvider: NSObject {
    static let shared = DependencyProvider()
    private let container = Container()
    private let resolver: Swinject.Resolver

    override private init() {
        let assemblies: [Assembly] = [
            RepositoryAssembly(),
            PresenterAssembly(),
            HelperAssembly(),
            InteractorAssembly()
        ]
        resolver = container.synchronize()
        super.init()
        assemblies.forEach({ $0.assemble(container: container) })
        assemblies.forEach({ $0.loaded(resolver: resolver) })
    }

    // MARK: - DependencyProvider

    func citySearchPresenter(viewContract: CitySearchViewContract,
                             presenterDelegate: CitySearchPresenterDelegate)
    -> CitySearchPresenter {
        return resolver.resolve(
            CitySearchPresenter.self,
            arguments: viewContract,
            presenterDelegate
        )!
    }

    func navigationManager() -> NavigationManager {
        return resolver.resolve(NavigationManager.self)!
    }
}
