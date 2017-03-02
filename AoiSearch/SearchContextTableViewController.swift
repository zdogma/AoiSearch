//
//  IndexTableViewController.swift
//  AoiSearch
//
//  Created by Tomohiro Zoda on 2017/03/02.
//  Copyright © 2017年 Tomohiro Zoda. All rights reserved.
//

import UIKit

class SearchContextTableViewController: UITableViewController {

    var searchContexts: [SearchContext] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            searchContexts = try loadSearchContexts()
        } catch {
            // TODO: ポップアップを表示
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
        return searchContexts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchContextCell", for: indexPath)
            as? SearchContextTableViewCell else {
                abort()
        }

        let searchContext = searchContexts[(indexPath as NSIndexPath).row]
        cell.apply(searchContext: searchContext)

        return cell
    }

    func loadSearchContexts() throws -> [SearchContext] {
        // TODO: 本来は DB から読むようにする
        // 現状はダミーの固定値をそのまま入れている
        let dummyContexts = [
            (iconUrl: "https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png", title: "渋谷がっつりランチ"),
            (iconUrl: "https://maps.gstatic.com/mapfiles/place_api/icons/museum-71.png", title: "近場の美術館")
        ]
        return dummyContexts.map { SearchContext(iconUrl: $0.iconUrl, title: $0.title) }
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
    override func tableView(_
        tableView: UITableView,
        commit editingStyle: UITableViewCellEditingStyle,
        forRowAt indexPath: IndexPath
     ) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array,
            // and add a new row to the table view
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

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlaces" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let searchContext = searchContexts[(indexPath as NSIndexPath).row]
                if let destinationViewController = segue.destination as? PlaceTableViewController {
                    destinationViewController.searchContext = searchContext
                }
            }
        }
    }

}
