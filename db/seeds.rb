# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying the old database"
Document.destroy_all
Category.destroy_all
Page.destroy_all
Tag.destroy_all
DocumentTag.destroy_all
User.destroy_all

puts "All the old database has been deleted"

puts "Creating new users..."
user1 = User.create!(first_name: 'Thomas', last_name: 'Thevenoud', email: "test@test.com", password: '123456')
puts "Some users have been created"

puts "Creating new categories..."
category1 = Category.create!(name: "Mes indispensables")
category2 = Category.create!(name: "Mes documents")
category3 = Category.create!(name: "L'administration & moi")
category4 = Category.create!(name: "Les dépenses & moi")
puts "Some categories have been created"

puts "Creating new tags..."
tag1 = Tag.create!(name: "Carte d'identité & Passeport", category: category1)
tag2 = Tag.create!(name: 'Carte vitale & mutuelle', category: category1)
tag3 = Tag.create!(name: 'R.I.B', category: category1)
tag4 = Tag.create!(name: 'Justificatif de domicile de - 3 de mois', category: category1)

tag5 = Tag.create!(name: 'Identité & Diplômes', category: category2)
tag6 = Tag.create!(name: 'Santé', category: category2)
tag7 = Tag.create!(name: 'Activités Professionnelles', category: category2)
tag8 = Tag.create!(name: 'Immobilier', category: category2)
tag9 = Tag.create!(name: 'Véhicules', category: category2)
tag10 = Tag.create!(name: 'Assurances', category: category2)

tag11 = Tag.create!(name: 'Impôts & taxes', category: category3)
tag12 = Tag.create!(name: 'Sécurité Sociale & mutuelle', category: category3)
tag13 = Tag.create!(name: 'Pajemploi', category: category3)

tag14 = Tag.create!(name: 'Dépenses mensuelles récurrentes', category: category4)
tag15 = Tag.create!(name: 'Factures / Garanties à conserver', category: category4)
tag16 = Tag.create!(name: 'Dépenses en ligne', category: category4)
puts "Some tags have been created"

puts "Creating new documents..."
document1 = Document.create!(name: "Carte d'identité", user: user1, reminder_date: Date.new(2020, 12, 12))
document2 = Document.create!(name: "Passeport", user: user1, reminder_date: Date.new(2021, 1, 9))
document3 = Document.create!(name: "RIB", user: user1, reminder_date: Date.new(2020, 10, 17))
document4 = Document.create!(name: "Carte vitale", user: user1, reminder_date: Date.new(2025, 5, 10))

document5 = Document.create!(name: "Contrat de travail", user: user1)
document6 = Document.create!(name: "Acte de naissance", user: user1)
document7 = Document.create!(name: "Diplôme de Master II", user: user1)
document8 = Document.create!(name: "Carte grise", user: user1, reminder_date: Date.new(2021, 1, 10))
document9 = Document.create!(name: "Assurance voiture", user: user1, reminder_date: Date.new(2020, 11, 8))
document10 = Document.create!(name: "Permis de conduire", user: user1, reminder_date: Date.new(2050, 6, 10))

document11 = Document.create!(name: "impots-02012020", user: user1)
document12 = Document.create!(name: "impots-02022020", user: user1)
document13 = Document.create!(name: "impots-02032020", user: user1)

document18 = Document.create!(name: "Facture CDiscount Janvier 2020", user: user1)
document19 = Document.create!(name: "Facture CDiscount Février 2020", user: user1)
document20 = Document.create!(name: "Facture EDF", user: user1)
puts "Some documents have been created"

puts "Creating new document tags..."
DocumentTag.create!(document: document1, tag: tag1)
DocumentTag.create!(document: document1, tag: tag5)

DocumentTag.create!(document: document2, tag: tag1)
DocumentTag.create!(document: document2, tag: tag5)

DocumentTag.create!(document: document3, tag: tag3)

DocumentTag.create!(document: document4, tag: tag2)
DocumentTag.create!(document: document4, tag: tag6)

DocumentTag.create!(document: document5, tag: tag7)

DocumentTag.create!(document: document6, tag: tag5)

DocumentTag.create!(document: document7, tag: tag5)

DocumentTag.create!(document: document8, tag: tag9)

DocumentTag.create!(document: document9, tag: tag9)

DocumentTag.create!(document: document10, tag: tag5)
DocumentTag.create!(document: document10, tag: tag9)

DocumentTag.create!(document: document11, tag: tag11)
DocumentTag.create!(document: document12, tag: tag11)
DocumentTag.create!(document: document13, tag: tag11)

DocumentTag.create!(document: document18, tag: tag14)
DocumentTag.create!(document: document19, tag: tag14)

DocumentTag.create!(document: document20, tag: tag14)
DocumentTag.create!(document: document20, tag: tag4)


puts "Some document tags have been created"


puts "Creating new pages..."
file1recto = URI.open('https://www.emat-carte-grise.sgs.com/dist/img/pages/cni.jpg')
page1recto = Page.create!(page_number: 1, document: document1)
page1recto.photo.attach(io: file1recto, filename: 'carte-identite-recto.jpg', content_type: 'image/jpg')

file1verso = URI.open('https://upload.wikimedia.org/wikipedia/commons/2/2b/French_Identity_card_1988_-_1994_Back.jpg')
page1verso = Page.create!(page_number: 2, document: document1)
page1verso.photo.attach(io: file1verso, filename: 'carte-identite-verso.jpg', content_type: 'image/jpg')

file2recto = URI.open('https://i.skyrock.net/2005/27502005/pics/1002972884_small.jpg')
page2recto = Page.create!(page_number: 1, document: document2)
page2recto.photo.attach(io: file2recto, filename: 'passeport.jpg', content_type: 'image/jpg')

file3recto = URI.open('https://faqs.teaming.net/fr/wp-content/uploads/sites/10/2019/10/RIB_correct.jpg')
page3recto = Page.create!(page_number: 1, document: document3)
page3recto.photo.attach(io: file3recto, filename: 'RIB.jpg', content_type: 'image/jpg')

file4recto = URI.open('https://frenchmorning.com/wp-content/uploads/2013/10/Vitale2.jpg')
page4recto = Page.create!(page_number: 1, document: document4)
page4recto.photo.attach(io: file4recto, filename: 'cartevitale-recto.jpg', content_type: 'image/jpg')

file5recto = URI.open('https://latromperieducodejustinien.files.wordpress.com/2017/05/acte-de-naissance-modif.png')
page5recto = Page.create!(page_number: 1, document: document6)
page5recto.photo.attach(io: file5recto, filename: 'acte-de-naissance.jpg', content_type: 'image/jpg')

contrat = URI.open('https://www.coover.fr/wp-content/uploads/2019/11/modele-cdi.png')
contratdetravail = Page.create!(page_number: 1, document: document5)
contratdetravail.photo.attach(io: contrat, filename: 'contratdetravail.jpg', content_type: 'image/jpg')

contrat = URI.open('https://static.docsity.com/documents_pages/2014/01/21/5384cff6b346a3ec9b9a69169cc24bd4.png')
contratdetravail = Page.create!(page_number: 2, document: document5)
contratdetravail.photo.attach(io: contrat, filename: 'contratdetravail2.jpg', content_type: 'image/jpg')


file6recto = URI.open('https://traduction-actes.com/WordPress/wp-content/uploads/2019/08/master.jpg')
page6recto = Page.create!(page_number: 1, document: document7)
page6recto.photo.attach(io: file6recto, filename: 'diplome-master.jpg', content_type: 'image/jpg')

file7recto = URI.open('https://www.autostyle-occasion.com/images/Image/Image/CONSEILS/nouvelle-carte-grise-specimen.jpg')
page7recto = Page.create!(page_number: 1, document: document8)
page7recto.photo.attach(io: file7recto, filename: 'carte-grise.jpg', content_type: 'image/jpg')

file8recto = URI.open('https://www.espritroue.fr/uploads/monthly_2018_12/233402209_Capturedcran2018-12-2012_16_24.png.935088bd6ae8fcb6d351064d98d1da54.png')
page8recto = Page.create!(page_number: 1, document: document9)
page8recto.photo.attach(io: file8recto, filename: 'carte-grise.jpg', content_type: 'image/jpg')

file9recto = URI.open('https://ap-utilitaire.com/wp-content/uploads/2019/06/Permis-de-conduire.jpg')
page9recto = Page.create!(page_number: 1, document: document10)
page9recto.photo.attach(io: file9recto, filename: 'permis-recto.jpg', content_type: 'image/jpg')

file9verso = URI.open('https://www.interieur.gouv.fr/var/miomcti/storage/images/media/mi/images/visuel-permis-conduire-verso/469513-1-fre-FR/Visuel-permis-conduire-verso.jpg')
page9verso = Page.create!(page_number: 2, document: document10)
page9verso.photo.attach(io: file9verso, filename: 'permis-recto.jpg', content_type: 'image/jpg')

file10 = URI.open('https://imgv2-1-f.scribdassets.com/img/document/325583222/original/ea033c5fd5/1597795582?v=1')
page10 = Page.create!(page_number: 1, document: document11)
page10.photo.attach(io: file10, filename: 'impots-02012020.jpg', content_type: 'image/jpg')

file11 = URI.open('https://www.rtvgeint.tv/avis-impot-2019.jpg')
page11 = Page.create!(page_number: 1, document: document12)
page11.photo.attach(io: file11, filename: 'impots-02022020.jpg', content_type: 'image/jpg')

file12 = URI.open('https://www.impots.gouv.fr/portail/www2/minisite/declaration/supports/declaration_automatique.jpg')
page12 = Page.create!(page_number: 1, document: document13)
page12.photo.attach(io: file12, filename: 'impots-02032020.jpg', content_type: 'image/jpg')


file16 = URI.open('https://imgv2-2-f.scribdassets.com/img/document/405873611/original/3da57a192d/1599055963?v=1')
page16 = Page.create!(page_number: 1, document: document18)
page16.photo.attach(io: file16, filename: 'facturecdiscount-01012020.jpg', content_type: 'image/jpg')

file17 = URI.open('https://0.academia-photos.com/attachment_thumbnails/51565457/mini_magick20190125-18879-1mn5tgc.png?1548408225')
page17 = Page.create!(page_number: 1, document: document19)
page17.photo.attach(io: file17, filename: 'facturecdiscount-01022020.jpg', content_type: 'image/jpg')


file18 = URI.open('https://www.edf.fr/sites/default/files/uploads/dmc-oh-nf36-prix-integres-1.png')
page18 = Page.create!(page_number: 1, document: document20)
page18.photo.attach(io: file18, filename: 'factureedf-01022020.jpg', content_type: 'image/jpg')


puts "Some pages have been created"




