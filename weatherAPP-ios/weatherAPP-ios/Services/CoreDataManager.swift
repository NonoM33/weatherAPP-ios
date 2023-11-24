//
//  CoreDataManager.swift
//  weatherAPP-ios
//
//  Created by renaud on 24/11/2023.
//

import CoreData

class CoreDataManager {

    static let shared = CoreDataManager()

    private init() {}

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "weatherAPP_ios")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Erreur de chargement du store Core Data : \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Erreur non résolue : \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // MARK: - Weather methods

    func saveOrUpdateCity(_ cityEntitie: WeatherCityEntitie) {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        fetchRequest.predicate = NSPredicate(format: "cityName == %@", cityEntitie.cityName)

        do {
            let result = try context.fetch(fetchRequest)
            let city = result.first as? City ?? City(context: context)

            city.cityName = cityEntitie.cityName
            city.date = cityEntitie.date

            try context.save()
        } catch {
            print("Erreur lors de la sauvegarde ou de la mise à jour : \(error)")
        }
    }

    func deleteCity(named cityName: String) {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "City")
        fetchRequest.predicate = NSPredicate(format: "cityName == %@", cityName)

        do {
            let result = try context.fetch(fetchRequest)
            if let cityToDelete = result.first as? City {
                context.delete(cityToDelete)
                try context.save()
            }
        } catch {
            print("Erreur lors de la suppression : \(error)")
        }
    }

    func fetchAllCities() -> [WeatherCityEntitie] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<City>(entityName: "City")

        do {
            let cities = try context.fetch(fetchRequest)
            return cities.map { city in
                WeatherCityEntitie(
                    cityName: city.cityName ?? "",
                    date: "",
                    temperature: "",
                    description: "",
                    rainMm: 0,
                    windKmh: "",
                    humidityPercent: 0,
                    UVIndex: 0,
                    hourlyTemp: [],
                    daysTemp: []
                )
            }
        } catch {
            print("Erreur lors de la récupération des villes : \(error)")
            return []
        }
    }
    // Ajoutez ici vos méthodes personnalisées pour interagir avec Core Data,
    // par exemple, pour créer, lire, mettre à jour et supprimer des objets.
}
