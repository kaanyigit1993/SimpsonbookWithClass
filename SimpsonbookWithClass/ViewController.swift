//
//  ViewController.swift
//  SimpsonbookWithClass
//
//  Created by KAAN YİĞİT on 17.04.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var simpsonMembers = [SimpsonClass]()
    var selectedSimpsonMembersItem : SimpsonClass?
   
    
  

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let bartSimpson = SimpsonClass(getName: "Bart", getJob: "Student", getImage: UIImage(named: "bart")!)
        let homerSimpson = SimpsonClass(getName: "Homer", getJob: "Engineer", getImage: UIImage(named: "homer")!)
        let lisaSimpson = SimpsonClass(getName: "Lisa", getJob: "Student", getImage: UIImage(named: "lisa")!)
        let maggieSimpson = SimpsonClass(getName: "Maggie", getJob: "Baby", getImage: UIImage(named: "maggie")!)
        let margeSimpson = SimpsonClass(getName: "marge", getJob: "Student", getImage: UIImage(named: "marge")!)
        
        simpsonMembers.append(bartSimpson)
        simpsonMembers.append(homerSimpson)
        simpsonMembers.append(lisaSimpson)
        simpsonMembers.append(maggieSimpson)
        simpsonMembers.append(margeSimpson)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonMembers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonMembers[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSimpsonMembersItem = simpsonMembers[indexPath.row]
        performSegue(withIdentifier: "toVC2", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toVC2" {
            let selectedItem = segue.destination as? ViewController2
            selectedItem?.getSimpsonMember = selectedSimpsonMembersItem
            
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            simpsonMembers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
}

