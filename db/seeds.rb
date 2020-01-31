# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
# Ship.create(name: 'USS Enterprise', ship_class: 'Galaxy', location: "Romulan Star Empire")
# Ship.create(name: 'Serenity', ship_class: 'Firefly', location: "Miranda")
Starship.create(name: 'Millenium Falcon', ship_class: 'YT-1300 Corellian Freighter', location: 'Galaxy far far away')
Starship.create(name: 'TIE Advanced X1', ship_class: 'TIE Advanced X1', location: 'Galaxy far far away')
Starship.create(name: 'Executor', ship_class: 'Super Star Destroyer', location: 'Galaxy far far away')

CrewMember.create(starship_id: 'Executor', first_name: 'Darth', last_name: 'Vader', specialty_division: 'The Empire')
CrewMember.create(first_name: 'Han', last_name: 'Solo', specialty_division: 'The Rebels')
CrewMember.create(first_name: 'Boba', last_name: 'Fett', specialty_division: 'Bounty Hunters')
