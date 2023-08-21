//
//  ViewController.swift
//  TableViewiOS
//
//  Created by Montserrat Medina on 2023-08-21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    struct Transaction {
        let date: String
        let number: String
        let description: String
        let amount : Int
    }
    
    enum Icons : String {
        case plus = "plus_icon"
        case minus = "minus_icon"
    }
    
    let data : [Transaction] = [
        Transaction(date: "18-ago-2023", number: "2508757", description: "Transf. Internet Banking", amount: -7500),
        Transaction(date: "18-ago-2023", number: "2508757", description: "Transf. Internet Banking", amount: -7500),
        Transaction(date: "18-ago-2023", number: "2508757", description: "Transferencia Enviada SPI", amount: -25000),
        Transaction(date: "18-ago-2023", number: "2508757", description: "Retiro efectivo en ATM", amount: -150000),
        Transaction(date: "18-ago-2023", number: "2508757", description: "Retiro efectivo en ATM", amount: -1500000),
        Transaction(date: "18-ago-2023", number: "2508757", description: "Retiro efectivo en ATM", amount: -1500000),
        Transaction(date: "18-ago-2023", number: "2508757", description: "Transferencia Enviada SPI", amount: -85000),
        Transaction(date: "18-ago-2023", number: "2508757", description: "Transferencia Enviada SPI", amount: -120000),
        Transaction(date: "18-ago-2023", number: "2508757", description: "Transf. Internet Banking", amount: 200000),
        Transaction(date: "18-ago-2023", number: "2508757", description: "Transf. Internet Banking", amount: 3150000)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

// MARK: -
// MARK: UITableView Controller
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Obtener la informacion del array
        let transaction = data[indexPath.row]
  
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
       
        let amount = "Gs. " + transaction.amount.formattedWithSeparator
        let icon = transaction.amount < 0 ? Icons.minus.rawValue : Icons.plus.rawValue
        
        cell.dateField.text = transaction.date
        cell.numberField.text = transaction.number
        cell.descriptionField.text = transaction.description
        cell.amountField.text = amount
        cell.iconImage.image = UIImage(named: icon)
        
        //If the amount is positive text to green
        if transaction.amount > 0 {
            cell.amountField.textColor = UIColor(red: 0.14, green: 0.46, blue: 0.32, alpha: 1.00)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
}

// MARK: -
// MARK: Thousand Separator
extension Formatter {
    static let withSeparator: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = "."
            return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}

