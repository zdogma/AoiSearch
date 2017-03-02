//
//  PlaceTableViewController.swift
//  AoiSearch
//
//  Created by Tomohiro Zoda on 2017/03/02.
//  Copyright © 2017年 Tomohiro Zoda. All rights reserved.
//

import UIKit

class PlaceTableViewController: UITableViewController {

    var searchContext: SearchContext!
    var places: [Place] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            places = try setPlaces()
        } catch {
            // TODO: ポップアップを表示する
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath)
            as? PlaceTableViewCell else {
                abort()
        }

        let place = places[(indexPath as NSIndexPath).row]
        cell.apply(place: place)

        return cell
    }

    func setPlaces() throws -> [Place] {
        // TODO: 本来は API を叩いてレスポンスを格納する
        // 現状はダミーの固定値をそのまま入れている
        let dummyPlaces = [
            (title: "ダミーラーメン", websiteUrl: "https://google.com"),
            (title: "ダミーとんかつ", websiteUrl: "https://google.com")
        ]
        return dummyPlaces.map { Place(title: $0.title, websiteUrl: $0.websiteUrl) }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(
        _
        tableView: UITableView,
        commit editingStyle: UITableViewCellEditingStyle,
        forRowAt indexPath: IndexPath
     ) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class,
            // insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
