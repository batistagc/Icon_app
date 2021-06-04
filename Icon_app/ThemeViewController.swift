//
//  ViewController.swift
//  Icon_app
//
//  Created by Gabriel Batista Cristiano on 02/06/21.
//

import UIKit

class ThemeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self,
                       forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
            viewModels: [
                TileCollectionViewCellViewModel(name: "Unidade", backgroundColor: .systemBackground, imageName: "weight1"),
                TileCollectionViewCellViewModel(name: "Brevidade", backgroundColor: .systemBackground, imageName: "weight2"),
                TileCollectionViewCellViewModel(name: "Alinhamento", backgroundColor: .systemBackground, imageName: "weight3"),
        ])
    ]

    @IBOutlet var labelTitulo: UILabel!
    @IBOutlet var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        labelTitulo.adjustsFontSizeToFitWidth = true
        labelTitulo.textColor = .label
        view.addSubview(labelTitulo)
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: 200, width: 450, height: 500)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CollectionTableViewCell.identifier,
                for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width + 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(viewModels[indexPath.row])
    }

}


extension ThemeViewController: CollectionTableViewCellDelegate{
    func CollectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        if viewModel.name == "Unidade"{
//           let secondViewController = SecondViewController()
//           secondViewController.modalPresentationStyle = .fullScreen
//           self.present(secondViewController, animated: true, completion: nil)
            performSegue(withIdentifier: "mySegue", sender: nil)
            
        }; if viewModel.name == "Brevidade" {
            let alert = UIAlertController(title: viewModel.name, message: "Clicô na Brevidade mano", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }; if viewModel.name == "Alinhamento" {
            let alert = UIAlertController(title: viewModel.name, message: "Clicô no alinhamento mano", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
}


