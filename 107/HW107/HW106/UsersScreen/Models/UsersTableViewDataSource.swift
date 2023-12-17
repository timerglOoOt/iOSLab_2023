import Foundation
import UIKit

class UsersTableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let users = CoreDataManager.shared.getAllUsers().filter({ $0.id != CoreDataManager.shared.getCurUser()?.id })
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath)
        as? UserTableViewCell
        guard let cell = cell else { return UITableViewCell() }
        let user = users[indexPath.row]
        cell.configure(user: user)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
