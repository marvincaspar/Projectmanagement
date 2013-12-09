# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create email: "admin@example.com", password: "password"
admin.add_role "admin"
user1 = User.create email: "user1@example.com", password: "password"
user1.add_role "user"
user2 = User.create email: "user2@example.com", password: "password"
user2.add_role "user"

project1 = Project.create title: 'Test Project'

package1 = Package.create title: '1. Package', project: project1, employee: user1
package2 = Package.create title: '2. Package', project: project1, employee: user1, prev_package: package1
package3 = Package.create title: '3. Package', project: project1, employee: user2, prev_package: package1
package4 = Package.create title: '4. Package', project: project1, employee: user2, prev_package: package3