kailey = User.find_or_create_by(username: "kailey16", password: "1234", fullname: "Kailey Lee", age: 28, gender: "female")
charlie = User.find_or_create_by(username: "char19", password: "5678", fullname: "Charlie Chung", age: 30, gender: "male")
list1 = List.find_or_create_by(title: "Before 40", creator: kailey)
list2 = List.find_or_create_by(title: "Before 60", creator: charlie)

item1 = Item.find_or_create_by(content: "breakfast", creator: kailey, list: list1, status: "In progress", category: "food")
item2 = Item.find_or_create_by(content: "travel prague", creator: kailey, list: list1, category: "country")

item3 = Item.find_or_create_by(content: "dinner", creator: charlie, list: list2, status: "Not started yet", category: "food")
item4 = Item.find_or_create_by(content: "travel Japan", creator: charlie, list: list2, category: "country")
