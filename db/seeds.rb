# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying the old database"
Category.destroy_all
User.destroy_all
Document.destroy_all
Page.destroy_all
puts "All the old database has been deleted"

puts "Creating new categories..."
category1 = Category.create!(name: "Mes indispensables")
category2 = Category.create!(name: "Mes documents")
category3 = Category.create!(name: "L'administration & moi")
category4 = Category.create!(name: "Les dépenses & moi")
puts "Some categories have been created"

puts "Creating new users..."
user1 = User.create!(first_name: 'Thomas', last_name: 'Thevenoud', email: "test@test.com", password: '123456')
puts "Some users have been created"

puts "Creating new documents..."
document1 = Document.create!(name: "Carte d'identité", user: user1)
document2 = Document.create!(name: "Passeport", user: user1)
document3 = Document.create!(name: "RIB", user: user1)
document3 = Document.create!(name: "Carte vitale", user: user1)

document4 = Document.create!(name: "Carte d'identité", user: user1)
document5 = Document.create!(name: "Acte de naissance", user: user1)
document6 = Document.create!(name: "Diplôme de Master II", user: user1)
document7 = Document.create!(name: "Carte grise", user: user1)
document8 = Document.create!(name: "Assurance voiture", user: user1)
document8 = Document.create!(name: "Permis de conduire", user: user1)

document9 = Document.create!(name: "impots-02012020", user: user1)
document10 = Document.create!(name: "impots-02022020", user: user1)
document11 = Document.create!(name: "impots-02032020", user: user1)
document12 = Document.create!(name: "impots-02042020", user: user1)
document13 = Document.create!(name: "impots-02052020", user: user1)
document14 = Document.create!(name: "impots-02062020", user: user1)
document15 = Document.create!(name: "impots-02072020", user: user1)


document9 = Document.create!(name: "Facture CDiscount", user: user1)
document10 = Document.create!(name: "Facture Amazon", user: user1)
document11 = Document.create!(name: "Facture Boulanger", user: user1)
document12 = Document.create!(name: "Facture Netflix", user: user1)
document13 = Document.create!(name: "Facture CDiscount", user: user1)
document14 = Document.create!(name: "Facture Boulanger", user: user1)
document15 = Document.create!(name: "Facture CDiscount", user: user1)
puts "Some documents have been created"


puts "Creating new pages..."
page1 = Page.create!(page_number: 1, document: document1, photo: open('https://www.emat-carte-grise.sgs.com/dist/img/pages/cni.jpg'))
page2 = Page.create!(page_number: 2, document: document1, photo: open('https://upload.wikimedia.org/wikipedia/commons/2/2b/French_Identity_card_1988_-_1994_Back.jpg'))
puts "Some pages have been created"



