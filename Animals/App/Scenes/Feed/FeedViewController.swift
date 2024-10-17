//
//  FeedViewController.swift
//  Animals
//
//  Created by Diggo Silva on 15/10/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    let feedView = FeedView()
    let viewModel = FeedViewModel()
    
    override func loadView() {
        super.loadView()
        view = feedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
    }
    
    private func setNavBar() {
        title = "Animais"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    }
    
    private func setDelegatesAndDataSources() {
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.animais.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell else { return UITableViewCell() }
        cell.configure(animal: viewModel.cellForRowAt(indexPath: indexPath))
        return cell
    }
}

enum AnimalType: Int {
    case mamifero = 1
    case reptil = 2
    case aves = 3
    case insetos = 4
    case peixes = 5
    case outros = 6
}

class Animal {
    let type: AnimalType
    let name: String
    let image: String
    let description: String
    
    init(type: AnimalType, name: String, image: String, description: String) {
        self.type = type
        self.name = name
        self.image = image
        self.description = description
    }
}

class FeedViewModel {
    let animais: [Animal] = [
        // Mamíferos
        
        Animal(type: .mamifero, name: "Cão", image: .dog, description: "O melhor amigo do homem."),
        Animal(type: .mamifero, name: "Gato", image: .cat, description: "Animais independentes e carinhosos."),
        
        // Répteis
        
        Animal(type: .reptil, name: "Tartaruga", image: .turtle, description: "Lenta, mas longeva."),
        Animal(type: .reptil, name: "Lagarto", image: .lizard, description: "Rápido e astuto."),
        
        // Aves
        
        Animal(type: .aves, name: "Pássaro", image: .bird, description: "Aves coloridas que cantam."),
        
        // Insetos
        
        Animal(type: .insetos, name: "Formiga", image: .ant, description: "Trabalhadoras em equipe."),
        Animal(type: .insetos, name: "Joaninha", image: .ladybug, description: "Inseto benéfico e colorido."),
        
        // Peixes
        
        Animal(type: .peixes, name: "Peixe", image: .fish, description: "Habitante dos rios e oceanos."),
        
        // Outros
        
        Animal(type: .outros, name: "Coelho", image: .rabbit, description: "Famoso por suas orelhas longas."),
    ]
    
    func cellForRowAt(indexPath: IndexPath) -> Animal {
        return animais[indexPath.row]
    }
}
