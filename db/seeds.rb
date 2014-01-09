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

project1 = Project.create name: 'Project #1', user: admin
project2 = Project.create name: 'Project #2', user: user1
auto = Project.create name: 'PKW', description: 'Wir bauen ein Auto', user: user1

pbs_pkw = ProductBreakdownStructure.create name: auto.name, level: 0, parent: 0, order: 0, user: user1, project: auto

pbs_karosserie = ProductBreakdownStructure.create name: 'Karosserie', level: pbs_pkw.level + 1, parent: pbs_pkw.id, order: 0, user: user1, project: auto
pbs_antriebskomplex = ProductBreakdownStructure.create name: 'Antriebskomplex', level: pbs_pkw.level + 1, parent: pbs_pkw.id, order: 0, user: user1, project: auto
pbs_fahrgestell = ProductBreakdownStructure.create name: 'Fahrgestell', level: pbs_pkw.level + 1, parent: pbs_pkw.id, order: 0, user: user1, project: auto

pbs_kotfluegel = ProductBreakdownStructure.create name: 'Kotflügel', level: pbs_karosserie.level + 1, parent: pbs_karosserie.id, order: 0, user: user1, project: auto
pbs_motorhaube = ProductBreakdownStructure.create name: 'Motorhaube', level: pbs_karosserie.level + 1, parent: pbs_karosserie.id, order: 0, user: user1, project: auto
pbs_tuer = ProductBreakdownStructure.create name: 'Tür', level: pbs_karosserie.level + 1, parent: pbs_karosserie.id, order: 0, user: user1, project: auto

pbs_motorblock = ProductBreakdownStructure.create name: 'Motorblock', level: pbs_antriebskomplex.level + 1, parent: pbs_antriebskomplex.id, order: 0, user: user1, project: auto
pbs_getriebe = ProductBreakdownStructure.create name: 'Getriebe', level: pbs_antriebskomplex.level + 1, parent: pbs_antriebskomplex.id, order: 0, user: user1, project: auto

pbs_vorderachse = ProductBreakdownStructure.create name: 'Vorderachse', level: pbs_fahrgestell.level + 1, parent: pbs_fahrgestell.id, order: 0, user: user1, project: auto
pbs_hinterachse = ProductBreakdownStructure.create name: 'Hinterachse', level: pbs_fahrgestell.level + 1, parent: pbs_fahrgestell.id, order: 0, user: user1, project: auto

pbs_rad1 = ProductBreakdownStructure.create name: 'Rad #1', level: pbs_vorderachse.level + 1, parent: pbs_vorderachse.id, order: 0, user: user1, project: auto
pbs_rad2 = ProductBreakdownStructure.create name: 'Rad #2', level: pbs_vorderachse.level + 1, parent: pbs_vorderachse.id, order: 0, user: user1, project: auto
pbs_rad3 = ProductBreakdownStructure.create name: 'Rad #3', level: pbs_hinterachse.level + 1, parent: pbs_hinterachse.id, order: 0, user: user1, project: auto
pbs_rad4 = ProductBreakdownStructure.create name: 'Rad #4', level: pbs_hinterachse.level + 1, parent: pbs_hinterachse.id, order: 0, user: user1, project: auto

pbs_reifen1 = ProductBreakdownStructure.create name: 'Reifen #1', level: pbs_rad1.level + 1, parent: pbs_rad1.id, order: 0, user: user1, project: auto
pbs_felge1 = ProductBreakdownStructure.create name: 'Felge #1', level: pbs_rad1.level + 1, parent: pbs_rad1.id, order: 0, user: user1, project: auto
pbs_reifen2 = ProductBreakdownStructure.create name: 'Reifen #2', level: pbs_rad2.level + 1, parent: pbs_rad2.id, order: 0, user: user1, project: auto
pbs_felge2 = ProductBreakdownStructure.create name: 'Felge #2', level: pbs_rad2.level + 1, parent: pbs_rad2.id, order: 0, user: user1, project: auto
pbs_reifen3 = ProductBreakdownStructure.create name: 'Reifen #3', level: pbs_rad3.level + 1, parent: pbs_rad3.id, order: 0, user: user1, project: auto
pbs_felge3 = ProductBreakdownStructure.create name: 'Felge #3', level: pbs_rad3.level + 1, parent: pbs_rad3.id, order: 0, user: user1, project: auto
pbs_reifen4 = ProductBreakdownStructure.create name: 'Reifen #4', level: pbs_rad4.level + 1, parent: pbs_rad4.id, order: 0, user: user1, project: auto
pbs_felge4 = ProductBreakdownStructure.create name: 'Felge #4', level: pbs_rad4.level + 1, parent: pbs_rad4.id, order: 0, user: user1, project: auto



wbs_pkw = WorkBreakdownStructure.create name: auto.name, level: 0, parent: 0, order: 0, user: user1, project: auto

wbs_karosserie = WorkBreakdownStructure.create name: 'Karosserie', level: wbs_pkw.level + 1, parent: wbs_pkw.id, order: 0, user: user1, project: auto
wbs_antriebskomplex = WorkBreakdownStructure.create name: 'Antriebskomplex', level: wbs_pkw.level + 1, parent: wbs_pkw.id, order: 0, user: user1, project: auto
wbs_fahrgestell = WorkBreakdownStructure.create name: 'Fahrgestell', level: wbs_pkw.level + 1, parent: wbs_pkw.id, order: 0, user: user1, project: auto

wbs_kotfluegel = WorkBreakdownStructure.create name: 'Kotflügel', level: wbs_karosserie.level + 1, parent: wbs_karosserie.id, order: 0, user: user1, project: auto
wbs_motorhaube = WorkBreakdownStructure.create name: 'Motorhaube', level: wbs_karosserie.level + 1, parent: wbs_karosserie.id, order: 0, user: user1, project: auto
wbs_tuer = WorkBreakdownStructure.create name: 'Tür', level: wbs_karosserie.level + 1, parent: wbs_karosserie.id, order: 0, user: user1, project: auto

wbs_motorblock = WorkBreakdownStructure.create name: 'Motorblock', level: wbs_antriebskomplex.level + 1, parent: wbs_antriebskomplex.id, order: 0, user: user1, project: auto
wbs_getriebe = WorkBreakdownStructure.create name: 'Getriebe', level: wbs_antriebskomplex.level + 1, parent: wbs_antriebskomplex.id, order: 0, user: user1, project: auto

wbs_vorderachse = WorkBreakdownStructure.create name: 'Vorderachse', level: wbs_fahrgestell.level + 1, parent: wbs_fahrgestell.id, order: 0, user: user1, project: auto
wbs_hinterachse = WorkBreakdownStructure.create name: 'Hinterachse', level: wbs_fahrgestell.level + 1, parent: wbs_fahrgestell.id, order: 0, user: user1, project: auto

wbs_rad1 = WorkBreakdownStructure.create name: 'Rad #1', level: wbs_vorderachse.level + 1, parent: wbs_vorderachse.id, order: 0, user: user1, project: auto
wbs_rad2 = WorkBreakdownStructure.create name: 'Rad #2', level: wbs_vorderachse.level + 1, parent: wbs_vorderachse.id, order: 0, user: user1, project: auto
wbs_rad3 = WorkBreakdownStructure.create name: 'Rad #3', level: wbs_hinterachse.level + 1, parent: wbs_hinterachse.id, order: 0, user: user1, project: auto
wbs_rad4 = WorkBreakdownStructure.create name: 'Rad #4', level: wbs_hinterachse.level + 1, parent: wbs_hinterachse.id, order: 0, user: user1, project: auto

wbs_reifen1 = WorkBreakdownStructure.create name: 'Reifen #1', level: wbs_rad1.level + 1, parent: wbs_rad1.id, order: 0, user: user1, project: auto
wbs_felge1 = WorkBreakdownStructure.create name: 'Felge #1', level: wbs_rad1.level + 1, parent: wbs_rad1.id, order: 0, user: user1, project: auto
wbs_reifen2 = WorkBreakdownStructure.create name: 'Reifen #2', level: wbs_rad2.level + 1, parent: wbs_rad2.id, order: 0, user: user1, project: auto
wbs_felge2 = WorkBreakdownStructure.create name: 'Felge #2', level: wbs_rad2.level + 1, parent: wbs_rad2.id, order: 0, user: user1, project: auto
wbs_reifen3 = WorkBreakdownStructure.create name: 'Reifen #3', level: wbs_rad3.level + 1, parent: wbs_rad3.id, order: 0, user: user1, project: auto
wbs_felge3 = WorkBreakdownStructure.create name: 'Felge #3', level: wbs_rad3.level + 1, parent: wbs_rad3.id, order: 0, user: user1, project: auto
wbs_reifen4 = WorkBreakdownStructure.create name: 'Reifen #4', level: wbs_rad4.level + 1, parent: wbs_rad4.id, order: 0, user: user1, project: auto
wbs_felge4 = WorkBreakdownStructure.create name: 'Felge #4', level: wbs_rad4.level + 1, parent: wbs_rad4.id, order: 0, user: user1, project: auto


