# MDL11_Generics
Example project that was demonstrated on MDL #11 meetup - https://www.youtube.com/watch?v=A4FrEyFBjVA. 
<br /><br />
Medium article - https://medium.com/chili-labs/configuring-multiple-cells-with-generics-in-swift-dcd5e209ba16.
<br /><br />
Medium article about handling cell actions - https://medium.com/chili-labs/handling-cell-actions-with-swift-generics-97604926a495. Branch: cellActions

------

This branch tracks the issue I've found when subclassing the cells.

Case in point:

	class BaseCell: UITableViewCell, ConfigurableCell {
		func configure(item: Base) {
			imageView?.image = item.image
			textLabel?.text = item.text
			detailTextLabel?.text = item.detail
		}
	}

	class Base {
		let image: UIImage?
		let text: String?
		let detail: String?

		init(image: UIImage?, text: String?, detail: String?) {
			self.image = image
			self.text = text
			self.detail = detail
		}
	}
	
then I modified the User class like so:

	class UserCell: BaseCell {}

	class User: Base {
		init(name: String, imageName: String) {
			super.init(image: UIImage(named: imageName), text: name, detail: nil)
		}
	}
	
The idea is simple: reuse UITableViewCell's `imageView`, `textLabel` and `detailLabel` while keeping the model semantics that's right for the app (e.g. `User`).

The problem appears in this line:

	typealias UserCellConfig = TableCellConfigurator<UserCell, User>
	Error:

	'TableCellConfigurator' requires the types 'User' and 'Base' be equivalent.
	Requirement specified as 'ItemType' == 'CellType.ItemType'
	[with CellType = UserCell, ItemType = User]

Looks like the comparison is too strict and doesn't count for the fact that `User` _is a_ `Base`. There's got to be a way to accomplish this, but it escapes me.
