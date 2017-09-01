# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

# Wine.destroy_all
# Game.destroy_all
# Question.destroy_all
# Suspect.destroy_all
# GameCategory.destroy_all
# Answer.destroy_all



# wines_attributes = [
#   {
#   estate: "Yealands estate",
#   cuvee: "Single Block S1",
#   label: "Awatere Valley",
#   region: "Marlborough",
#   country: "Nouvelle-Zélande",
#   vintage: 2014,
#   grape_varieties: "Sauvignon blanc",
#   color: "Blanc",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Jaune citron",
#   aromas_family: "Fruité et végétal",
#   sweetness: 1,
#   acidity: 2,
#   tannins: 0,
#   alcohol: 2,
#   body: 1,
#   # bitterness: 0,
#   # fruitiness: 3,
#   length: 2
#   },
#   {
#   estate: "Aux caves de Pouilly-sur-Loire",
#   cuvee: "La Tuilerie",
#   label: "Pouilly-Fumé",
#   region: "Loire",
#   country: "France",
#   vintage: 2014,
#   grape_varieties: "Sauvignon blanc",
#   color: "Blanc",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Jaune vert",
#   aromas_family: "Fruité et végétal",
#   sweetness: 1,
#   acidity: 3,
#   tannins: 0,
#   alcohol: 2,
#   body: 1,
#   # bitterness: 0,
#   # fruitiness: 2,
#   length: 2
#   },
#   {
#   estate: "Domaine Trotereau",
#   cuvee: "Calcite",
#   label: "Quincy",
#   region: "Loire",
#   country: "France",
#   vintage: 2014,
#   grape_varieties: "Sauvignon blanc",
#   color: "Blanc",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Jaune vert",
#   aromas_family: "Fruité et minéral",
#   sweetness: 1,
#   acidity: 3,
#   tannins: 0,
#   alcohol: 1,
#   body: 1,
#   # bitterness: 0,
#   # fruitiness: 3,
#   length: 2
#   },
#   {
#   estate: "Baron de Hoen",
#   cuvee: "",
#   label: "Gewurztraminer",
#   region: "Alsace",
#   country: "France",
#   vintage: 2013,
#   grape_varieties: "Gewurztraminer",
#   color: "Blanc",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Jaune citron",
#   aromas_family: "Fruité et floral",
#   sweetness: 2,
#   acidity: 2,
#   tannins: 0,
#   alcohol: 2,
#   body: 2,
#   # bitterness: 0,
#   # fruitiness: 3,
#   length: 2
#   },
#   {
#   estate: "Domaine Marcel Richaud",
#   cuvee: "",
#   label: "Côtes Du Rhône Villages",
#   region: "Rhône méridional",
#   country: "France",
#   vintage: 2014,
#   grape_varieties: "Syrah, grenache",
#   color: "Rouge",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Grenat",
#   aromas_family: "Fruité et épicé",
#   sweetness: 1,
#   acidity: 1,
#   tannins: 2,
#   alcohol: 2,
#   body: 3,
#   # bitterness: 0,
#   # fruitiness: 2,
#   length: 3
#   },
#   {
#   estate: "",
#   cuvee: "Riesling",
#   label: "Barrossa",
#   region: "Barrossa Valley",
#   country: "Australie",
#   vintage: 2013,
#   grape_varieties: "Riesling",
#   color: "Blanc",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Jaune citron",
#   aromas_family: "Fruité et floral",
#   sweetness: 1,
#   acidity: 2,
#   tannins: 0,
#   alcohol: 1,
#   body: 1,
#   # bitterness: 0,
#   # fruitiness: 2,
#   length: 2
#   },
#   {
#   estate: "Roc Mc Donald Wines",
#   cuvee: "Quarter Acre",
#   label: "Syrah",
#   region: "Hawke's Bay",
#   country: "France",
#   vintage: 2013,
#   grape_varieties: "Syrah",
#   color: "Rouge",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Rubis",
#   aromas_family: "Fruité et épicé",
#   sweetness: 1,
#   acidity: 3,
#   tannins: 2,
#   alcohol: 2,
#   body: 3,
#   # bitterness: 0,
#   # fruitiness: 2,
#   length: 2
#   },
#   {
#   estate: "Vincent Bolveri",
#   cuvee: "Fontissimo",
#   label: "Medoc",
#   region: "Bordeaux",
#   country: "France",
#   vintage: 2013,
#   grape_varieties: "Cabernet Sauvignon, Merlot",
#   color: "Rouge",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Rubis",
#   aromas_family: "Fruité et épicé",
#   sweetness: 1,
#   acidity: 2,
#   tannins: 3,
#   alcohol: 2,
#   body: 3,
#   # bitterness: 0,
#   # fruitiness: 2,
#   length: 3
#   },
#   {
#   estate: "Catherine & Pierre Breton",
#   cuvee: "",
#   label: "Chinon",
#   region: "Loire",
#   country: "France",
#   vintage: 2012,
#   grape_varieties: "Syrah",
#   color: "Rouge",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Rubis",
#   aromas_family: "Fruité",
#   sweetness: 1,
#   acidity: 3,
#   tannins: 2,
#   alcohol: 2,
#   body: 3,
#   # bitterness: 0,
#   # fruitiness: 2,
#   length: 3
#   },
#   {
#   estate: "Domaine de la Paonnière",
#   cuvee: "",
#   label: "Coteaux d'Ancenis",
#   region: "Loire",
#   country: "France",
#   vintage: 2014,
#   grape_varieties: "Gamay",
#   color: "Rouge",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Violacé",
#   aromas_family: "Fruité",
#   sweetness: 1,
#   acidity: 2,
#   tannins: 1,
#   alcohol: 2,
#   body: 1,
#   # bitterness: 0,
#   # fruitiness: 3,
#   length: 2
#   },
#   {
#   estate: "Ravenswood",
#   cuvee: "",
#   label: "Chardonnay",
#   region: "Californie",
#   country: "USA",
#   vintage: 2014,
#   grape_varieties: "Chardonnay",
#   color: "Blanc",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Jaune citron",
#   aromas_family: "Fruité et empyreumatique",
#   sweetness: 1,
#   acidity: 2,
#   tannins: 0,
#   alcohol: 2,
#   body: 2,
#   # bitterness: 0,
#   # fruitiness: 2,
#   length: 3
#   },
#   {
#   estate: "Welderberg Winery",
#   cuvee: "Cabernet Sauvignon",
#   label: "Stellenbosh",
#   region: "Stellenbosch",
#   country: "Afrique du Sud",
#   vintage: 2013,
#   grape_varieties: "Cabernet Sauvignon",
#   color: "Rouge",
#   volume: "75 cl",
#   # tasting_date: "22/02/2016",
#   # taster: "Dimitri",
#   tasting_color: "Rubis",
#   aromas_family: "Fruité et épicé",
#   sweetness: 1,
#   acidity: 2,
#   tannins: 3,
#   alcohol: 2,
#   body: 3,
#   # bitterness: 0,
#   # fruitiness: 2,
#   length: 3
#   }
# ]
# wines_attributes.each { |params| Wine.create!(params) }

# suspect_1 = Suspect.create!(
#   photo_freaky: File.open(Rails.root.join("db/fixtures/photos/suspect_edouard_freaky.jpg")),
#   photo_happy: File.open(Rails.root.join("db/fixtures/photos/suspect_edouard_happy.jpg")),
#   photo_sad: File.open(Rails.root.join("db/fixtures/photos/suspect_edouard_sad.jpg")),
#   name: "Auguste Foussier (Assistant de direction)",
#   description: "Dandy à l'ancienne. Bienveillant en façade, personne ne sait ce qu'il pense. Il aurait une aventure avec la DirCom."
#   )
# suspect_2 = Suspect.create!(
#   photo_freaky: File.open(Rails.root.join("db/fixtures/photos/suspect_quitwy_freaky.jpg")),
#   photo_happy: File.open(Rails.root.join("db/fixtures/photos/suspect_quitwy_happy.jpg")),
#   photo_sad: File.open(Rails.root.join("db/fixtures/photos/suspect_quitwy_sad.jpg")),
#   name: "Mlle Quitwy (DirCom)",
#   description: "Elégante et froide au 1er abord comme au 2e d’ailleurs."
#   )
# suspect_3 = Suspect.create!(
#   photo_freaky: File.open(Rails.root.join("db/fixtures/photos/suspect_thomas_freaky.jpg")),
#   photo_happy: File.open(Rails.root.join("db/fixtures/photos/suspect_thomas_happy.jpg")),
#   photo_sad: File.open(Rails.root.join("db/fixtures/photos/suspect_thomas_sad.jpg")),
#   name: "De Moulis (Chef comptable)",
#   description: "Des faux-airs d’une sorte d’Harrison Ford allemand. Troublant de calme."
#   )
# suspect_4 = Suspect.create!(
#   photo_freaky: File.open(Rails.root.join("db/fixtures/photos/suspect_charles_freaky.jpg")),
#   photo_happy: File.open(Rails.root.join("db/fixtures/photos/suspect_charles_happy.jpg")),
#   photo_sad: File.open(Rails.root.join("db/fixtures/photos/suspect_charles_sad.jpg")),
#   name: "Val Kilmerpa (Chef des Opérations)",
#   description: "Ses dents rayent le parquet! Son ambition pour le trône est de notoriété publique!!"
#   )

# category1 = GameCategory.create!(category: "Case")
# # category2 = GameCategory.create!(category: "Battle")

# wine_1 = Wine.find(1)
# wine_2 = Wine.find(2)
# wine_3 = Wine.find(3)
# wine_4 = Wine.find(4)
# wine_5 = Wine.find(5)
# wine_6 = Wine.find(6)
# wine_7 = Wine.find(7)
# wine_8 = Wine.find(8)
# wine_9 = Wine.find(9)
# wine_10 = Wine.find(10)
# wine_11 = Wine.find(11)
# wine_12 = Wine.find(12)

# question_17 = Question.create!(value: "Qu'est-ce qu'un magnum de vin?",typ:"recruitment_qcm", theme: "Cuir Cuir Moustache", tips: "Sérieusement? Besoin d'aide sur cette question?")
# answer_65 = Answer.create!(question: question_17, value: "Un grand moustachu", good_answer: false)
# answer_66 = Answer.create!(question: question_17, value: "Une bouteille de 75cl", good_answer: false)
# answer_67 = Answer.create!(question: question_17, value: "Une bouteille de 150cl", good_answer: true)
# answer_68 = Answer.create!(question: question_17, value: "Une arme en verre recyclé", good_answer: false)
# answer_69 = Answer.create!(question: question_17, value: "Une bouteille d'1,5l", good_answer: true)
# answer_70 = Answer.create!(question: question_17, value: "Une glace au vin", good_answer: false)
# answer_71 = Answer.create!(question: question_17, value: "Une agence de presse spécialisée dans le vin", good_answer: false)
# answer_72 = Answer.create!(question: question_17, value: "L'équivalent de 2 bouteilles de 0.75l", good_answer: true)
# answer_73 = Answer.create!(question: question_17, value: "La moitié d'un jéroboam", good_answer: true)

# question_18 = Question.create!(value: "Laquelle de ces appellations ne se trouve pas dans le Bordelais?",typ:"recruitment_qcm", theme: "Géo Bordeaux", tips: "50/50")
# answer_74 = Answer.create!(question: question_18, value: "Margaux", good_answer: false)
# answer_75 = Answer.create!(question: question_18, value: "Margot", good_answer: true)
# answer_76 = Answer.create!(question: question_18, value: "Saint-émilion", good_answer: false)
# answer_77 = Answer.create!(question: question_18, value: "Entre-Deux-Mers", good_answer: false)
# answer_78 = Answer.create!(question: question_18, value: "Pomerol", good_answer: false)
# answer_79 = Answer.create!(question: question_18, value: "Cahors", good_answer: true)
# answer_80 = Answer.create!(question: question_18, value: "Pommard", good_answer: true)
# answer_81 = Answer.create!(question: question_18, value: "Pauillac", good_answer: false)
# answer_82 = Answer.create!(question: question_18, value: "Bordeaux Supérieur", good_answer: false)
# answer_83 = Answer.create!(question: question_18, value: "Bordeaux Inférieur", good_answer: true)
# answer_84 = Answer.create!(question: question_18, value: "Chinon", good_answer: true)
# answer_85 = Answer.create!(question: question_18, value: "Château Bordeaux", good_answer: true)
# answer_86 = Answer.create!(question: question_18, value: "Chinon", good_answer: true)
# answer_87 = Answer.create!(question: question_18, value: "Medoc", good_answer: false)
# answer_88 = Answer.create!(question: question_18, value: "Côtes-de-Blaye", good_answer: false)

# question_19 = Question.create!(value: "Quel pays possède la plus grande surface viticole au monde?",typ:"recruitment_qcm", theme: "Question de surface", tips: "50/50")
# answer_89 = Answer.create!(question: question_19, value: "Vatican", good_answer: false)
# answer_90 = Answer.create!(question: question_19, value: "Espagne", good_answer: true)
# answer_91 = Answer.create!(question: question_19, value: "Luxembourg", good_answer: false)
# answer_92 = Answer.create!(question: question_19, value: "Angleterre", good_answer: false)
# answer_93 = Answer.create!(question: question_19, value: "Chine", good_answer: false)
# answer_94 = Answer.create!(question: question_19, value: "Slovénie", good_answer: false)
# answer_95 = Answer.create!(question: question_19, value: "Géorgie", good_answer: false)
# answer_96 = Answer.create!(question: question_19, value: "Suède", good_answer: false)
# answer_97 = Answer.create!(question: question_19, value: "Finlande", good_answer: false)
# answer_98 = Answer.create!(question: question_19, value: "Russie", good_answer: false)
# answer_99 = Answer.create!(question: question_19, value: "Australie", good_answer: false)

# question_20 = Question.create!(value: "Quel est le 1er pays consommateur de vin au monde par habitant?",typ:"recruitment_qcm", theme: "Question de modération", tips: "50/50")
# answer_100 = Answer.create!(question: question_20, value: "Vatican", good_answer: true)
# answer_101 = Answer.create!(question: question_20, value: "Italie", good_answer: false)
# answer_102 = Answer.create!(question: question_20, value: "Slovénie", good_answer: false)
# answer_103 = Answer.create!(question: question_20, value: "Croatie", good_answer: false)
# answer_104 = Answer.create!(question: question_20, value: "France", good_answer: false)
# answer_105 = Answer.create!(question: question_20, value: "Russie", good_answer: false)
# answer_106 = Answer.create!(question: question_20, value: "Japon", good_answer: false)
# answer_107 = Answer.create!(question: question_20, value: "USA", good_answer: false)
# answer_108 = Answer.create!(question: question_20, value: "Angleterre", good_answer: false)
# answer_109 = Answer.create!(question: question_20, value: "Irlande", good_answer: false)
# answer_110 = Answer.create!(question: question_20, value: "Australie", good_answer: false)

# question_21 = Question.create!(value: "Que préconise l'OMS en matière de consommation de vin?",typ:"recruitment_qcm", theme: "Question de santé", tips: "50/50")
# answer_111 = Answer.create!(question: question_21, value: "Moins de 2 verres/jour pour une femme", good_answer: true)
# answer_112 = Answer.create!(question: question_21, value: "Moins de 3 verres/jour pour un homme", good_answer: true)
# answer_113 = Answer.create!(question: question_21, value: "Ne pas boire au moins 1 semaine par an", good_answer: true)
# answer_114 = Answer.create!(question: question_21, value: "Ne pas boire au moins 1 jour par semaine", good_answer: true)
# answer_115 = Answer.create!(question: question_21, value: "Moins d'1 litre par jour", good_answer: false)
# answer_116 = Answer.create!(question: question_21, value: "Plus de 2 verres par jour pour une femme", good_answer: false)
# answer_117 = Answer.create!(question: question_21, value: "Moins de 5 verres/jour pour un homme", good_answer: false)
# answer_118 = Answer.create!(question: question_21, value: "Ne pas boire à la bouteille", good_answer: false)
# answer_119 = Answer.create!(question: question_21, value: "Boire du Monton-Rothschild régulièrement", good_answer: false)
# answer_120 = Answer.create!(question: question_21, value: "Boire du vin français!!", good_answer: false)
# answer_121 = Answer.create!(question: question_21, value: "Ne pas partager", good_answer: false)

# question_22 = Question.create!(value: "Un vin tranquille est un vin ...",typ:"recruitment_qcm", theme: "Question zen", tips: "50/50")
# answer_122 = Answer.create!(question: question_22, value: "... non pétillant", good_answer: true)
# answer_123 = Answer.create!(question: question_22, value: "... qui ne bulle pas", good_answer: true)
# answer_124 = Answer.create!(question: question_22, value: "... qui ne cherche pas les ennuis", good_answer: false)
# answer_125 = Answer.create!(question: question_22, value: "... qui repose en cave", good_answer: false)
# answer_126 = Answer.create!(question: question_22, value: "... appartenant à un maître yogi", good_answer: false)
# answer_127 = Answer.create!(question: question_22, value: "... qui rend zen", good_answer: false)
# answer_128 = Answer.create!(question: question_22, value: "... fortifié", good_answer: false)
# answer_129 = Answer.create!(question: question_22, value: "... qui bulle", good_answer: false)

# question_23 = Question.create!(value: "Dans un raisin, la pruine ...",typ:"recruitment_qcm", theme: "Question chelou", tips: "50/50")
# answer_130 = Answer.create!(question: question_23, value: "... contient des levures", good_answer: true)
# answer_131 = Answer.create!(question: question_23, value: "... est un fruit bien juiteux", good_answer: false)
# answer_132 = Answer.create!(question: question_23, value: "... est une pluie légère", good_answer: false)
# answer_133 = Answer.create!(question: question_23, value: "... est une couche cireuse", good_answer: true)
# answer_134 = Answer.create!(question: question_23, value: "... est un raisin noir à jus blanc", good_answer: false)
# answer_136 = Answer.create!(question: question_23, value: "... c'est quand il n'a plus de jus", good_answer: false)
# answer_137 = Answer.create!(question: question_23, value: "... correspond à l'huile des pépins", good_answer: false)

# question_24 = Question.create!(value: "La pourriture noble ...",typ:"recruitment_qcm", theme: "Question royale", tips: "50/50")
# answer_138 = Answer.create!(question: question_24, value: "... est causée par un champignon", good_answer: true)
# answer_139 = Answer.create!(question: question_24, value: "... est un royaliste verreux", good_answer: false)
# answer_140 = Answer.create!(question: question_24, value: "... est un ravageur de la vigne", good_answer: false)
# answer_141 = Answer.create!(question: question_24, value: "... est à l'origine de vins liquoreux", good_answer: true)
# answer_142 = Answer.create!(question: question_24, value: "... se développe sous des conditions sèches", good_answer: false)
# answer_143 = Answer.create!(question: question_24, value: "... est aussi appelée Botrytis cinerea", good_answer: true)
# answer_144 = Answer.create!(question: question_24, value: "... se développe chaque année à Sauternes", good_answer: false)
# answer_145 = Answer.create!(question: question_24, value: "... peut se développer en Espagne", good_answer: false)

# question_25 = Question.create!(value: "Qu'est-ce que la fermentation alcoolique?",typ:"recruitment_qcm", theme: "Question fermée", tips: "50/50")
# answer_146 = Answer.create!(question: question_25, value: "L'action d'enfermer l'alcool dans une bouteille", good_answer: false)
# answer_147 = Answer.create!(question: question_25, value: "La conversion du sucre en alcool", good_answer: true)
# answer_148 = Answer.create!(question: question_25, value: "Un endroit où l'on peut fermenter tranquille", good_answer: false)
# answer_149 = Answer.create!(question: question_25, value: "L'action d'entretenir les troubles du vin", good_answer: false)
# answer_150 = Answer.create!(question: question_25, value: "L'acide malique devient lactique", good_answer: false)
# answer_151 = Answer.create!(question: question_25, value: "La sieste après 3 verres", good_answer: false)

# question_26 = Question.create!(value: "Lequel de ces cépages permet uniquement la production de vins blanc?",typ:"recruitment_qcm", theme: "Plus blanc que blanc", tips: "50/50")
# answer_152 = Answer.create!(question: question_26, value: "Syrah", good_answer: false)
# answer_153 = Answer.create!(question: question_26, value: "Pinot noir", good_answer: false)
# answer_154 = Answer.create!(question: question_26, value: "Pinot gris", good_answer: true)
# answer_155 = Answer.create!(question: question_26, value: "Pinotage", good_answer: false)
# answer_156 = Answer.create!(question: question_26, value: "Cabernet sauvignon", good_answer: false)
# answer_157 = Answer.create!(question: question_26, value: "Chardonnay", good_answer: true)
# answer_158 = Answer.create!(question: question_26, value: "Sauvignon blanc", good_answer: true)
# answer_159 = Answer.create!(question: question_26, value: "Cabernet franc", good_answer: false)
# answer_160 = Answer.create!(question: question_26, value: "Grenache", good_answer: false)
# answer_161 = Answer.create!(question: question_26, value: "Merlot", good_answer: false)
# answer_162 = Answer.create!(question: question_26, value: "Viognier", good_answer: true)
# answer_163 = Answer.create!(question: question_26, value: "Riesling", good_answer: true)


# question_1 = Question.create!(value: "Quelle est la couleur de ce vin?",typ:"qcm", theme: "Regardez dans votre verre", tips: "La couleur d'un vin blanc se juge en son centre et non sur sa frange. Le jaune citron et le jaune vert sont les couleurs qui reviennent le plus souvent", wine_color: "Blanc")
# answer_1 = Answer.create!(question: question_1, value: "Jaune vert", wine_color: "Blanc")
# answer_2 = Answer.create!(question: question_1, value: "Jaune citron", wine_color: "Blanc")
# answer_3 = Answer.create!(question: question_1, value: "Orangé", wine_color: "Blanc")
# answer_4 = Answer.create!(question: question_1, value: "Jaune poussin", wine_color: "Blanc")
# answer_5 = Answer.create!(question: question_1, value: "Blanc", wine_color: "Blanc")
# answer_6 = Answer.create!(question: question_1, value: "Rosé", wine_color: "Blanc")
# answer_7 = Answer.create!(question: question_1, value: "Claire", wine_color: "Blanc")
# question_2 = Question.create!(value: "Quelle est la famille d'arômes dominante dans ce vin?",typ:"qcm", theme: "Sentez maintenant!", tips: "", wine_color: "Blanc")
# answer_8 = Answer.create!(question: question_2, value: "Animal", wine_color: "Blanc")
# answer_9 = Answer.create!(question: question_2, value: "Empyreumatique", wine_color: "Blanc")
# answer_10 = Answer.create!(question: question_2, value: "Fruité", wine_color: "Blanc")
# answer_11 = Answer.create!(question: question_2, value: "Floral", wine_color: "Blanc")
# answer_12 = Answer.create!(question: question_2, value: "Végétal", wine_color: "Blanc")
# answer_13 = Answer.create!(question: question_2, value: "Bonne", wine_color: "Blanc")
# answer_14 = Answer.create!(question: question_2, value: "Vinique", wine_color: "Blanc")
# question_3 = Question.create!(value: "Evaluez le niveau de douceur de ce vin :",typ:"gauge", theme: "Goutez maintenant! la douceur", tips: "Douceur = Sucre - Le sucre est perceptible à partir de 4 g/l. En dessous les vins sont dits : 'secs'!", wine_color: "Blanc")
# answer_15 = Answer.create!(question: question_3, value: "1", title: "sec", wine_color: "Blanc")
# answer_16 = Answer.create!(question: question_3, value: "2", title: "sec-tendre", wine_color: "Blanc")
# answer_17 = Answer.create!(question: question_3, value: "3", title: "moelleux", wine_color: "Blanc")
# answer_18 = Answer.create!(question: question_3, value: "4", title: "liquoreux", wine_color: "Blanc")
# question_4 = Question.create!(value: "Evaluez le niveau d'acidité de ce vin :",typ:"gauge", theme: "Goutez! l'acidité", tips: "Acidité = Salivation - Plus on salive, plus un vin est acide.", wine_color: "Blanc")
# answer_19 = Answer.create!(question: question_4, value: "1", title: "léger", wine_color: "Blanc")
# answer_20 = Answer.create!(question: question_4, value: "2", title: "moyen", wine_color: "Blanc")
# answer_21 = Answer.create!(question: question_4, value: "3", title: "élevé", wine_color: "Blanc")
# question_5 = Question.create!(value: "Evaluez le niveau d'alcool de ce vin :",typ:"gauge", theme: "Goutez! l'alcool", tips: "Petit tips : Inspirez brièvement après une gorgée. Plus la brûlure ressentie dans le fond de la gorge est forte, plus il y a d'alcool. On peut aussi regarder le titrage de la bouteille... Mais c'est d'la triche!!", wine_color: "Blanc")
# answer_22 = Answer.create!(question: question_5, value: "1", title: "léger", wine_color: "Blanc")
# answer_23 = Answer.create!(question: question_5, value: "2", title: "moyen", wine_color: "Blanc")
# answer_24 = Answer.create!(question: question_5, value: "3", title: "élevé", wine_color: "Blanc")
# question_6 = Question.create!(value: "Evaluez le corps de ce vin :",typ:"gauge", theme: "Goutez! le corps", tips: "Le corps correspond au poids, au volume du vin en bouche. L'acidité diminuera le corps tandis que l'alcool et la douceur l'augmenteront", wine_color: "Blanc")
# answer_25 = Answer.create!(question: question_6, value: "1", title: "léger", wine_color: "Blanc")
# answer_26 = Answer.create!(question: question_6, value: "2", title: "moyen", wine_color: "Blanc")
# answer_27 = Answer.create!(question: question_6, value: "3", title: "charpenté", wine_color: "Blanc")
# question_7 = Question.create!(value: "Evaluez la longueur de ce vin :",typ:"gauge", theme: "Goutez! la longueur", tips: "La longueur correpond au temps pendant lequel les arômes agréables sont ressentis. En dessous de 3s le vin sera court. Au dessus de 10s le vin sera long.", wine_color: "Blanc")
# answer_28 = Answer.create!(question: question_7, value: "1", title: "court", wine_color: "Blanc")
# answer_29 = Answer.create!(question: question_7, value: "2", title: "moyen", wine_color: "Blanc")
# answer_30 = Answer.create!(question: question_7, value: "3", title: "long", wine_color: "Blanc")
# question_8 = Question.create!(value: "Qui est le meurtrier?",typ:"suspect", theme: "Enquêtez", wine_color: "Blanc")
# answer_31 = Answer.create!(question: question_8, value: "Suspect n°1", wine_color: "Blanc")
# answer_32 = Answer.create!(question: question_8, value: "Suspect n°2", wine_color: "Blanc")
# answer_33 = Answer.create!(question: question_8, value: "Suspect n°3", wine_color: "Blanc")

# question_9 = Question.create!(value: "Quelle est la couleur de ce vin?",typ:"qcm", theme: "Regardez dans votre verre", tips: "La couleur d'un vin rouge se juge plus facilement sur sa frange et non en son centre. Le rubis et le violacé sont les couleurs qui reviennent le plus souvent", wine_color: "Rouge")
# answer_34 = Answer.create!(question: question_9, value: "Violacé", wine_color: "Rouge")
# answer_35 = Answer.create!(question: question_9, value: "Rubis", wine_color: "Rouge")
# answer_36 = Answer.create!(question: question_9, value: "Orangé", wine_color: "Rouge")
# answer_37 = Answer.create!(question: question_9, value: "Rouge gorge", wine_color: "Rouge")
# question_10 = Question.create!(value: "Quelle est la famille d'arômes dominante dans ce vin?",typ:"qcm", theme: "Sentez maintenant!", tips: "", wine_color: "Rouge")
# answer_38 = Answer.create!(question: question_10, value: "Florale", wine_color: "Rouge")
# answer_39 = Answer.create!(question: question_10, value: "Empyreumatique", wine_color: "Rouge")
# answer_40 = Answer.create!(question: question_10, value: "Epicée", wine_color: "Rouge")
# answer_41 = Answer.create!(question: question_10, value: "Fruité", wine_color: "Rouge")
# answer_42 = Answer.create!(question: question_10, value: "Végétale", wine_color: "Rouge")
# answer_43 = Answer.create!(question: question_10, value: "Animale", wine_color: "Rouge")
# answer_44 = Answer.create!(question: question_10, value: "Bonne", wine_color: "Rouge")
# answer_45 = Answer.create!(question: question_10, value: "Vinique", wine_color: "Rouge")
# question_11 = Question.create!(value: "Evaluez le niveau de douceur de ce vin :",typ:"gauge", theme: "Goutez maintenant! la douceur", tips: "Douceur = Sucre - Le sucre est perceptible à partir de 4 g/l. En dessous les vins sont dits : 'secs'!", wine_color: "Rouge")
# answer_46 = Answer.create!(question: question_11, value: "1", title: "sec", wine_color: "Rouge")
# answer_47 = Answer.create!(question: question_11, value: "2", title: "sec-tendre", wine_color: "Rouge")
# answer_48 = Answer.create!(question: question_11, value: "3", title: "moelleux", wine_color: "Rouge")
# answer_49 = Answer.create!(question: question_11, value: "4", title: "liquoreux", wine_color: "Rouge")
# question_12 = Question.create!(value: "Evaluez le niveau d'acidité de ce vin :",typ:"gauge", theme: "Goutez! l'acidité", tips: "Acidité = Salivation - Plus on salive, plus un vin est acide.", wine_color: "Rouge")
# answer_50 = Answer.create!(question: question_12, value: "1", title: "léger", wine_color: "Rouge")
# answer_51 = Answer.create!(question: question_12, value: "2", title: "moyen", wine_color: "Rouge")
# answer_52 = Answer.create!(question: question_12, value: "3", title: "élevé", wine_color: "Rouge")
# question_13 = Question.create!(value: "Evaluez le niveau d'alcool de ce vin :",typ:"gauge", theme: "Goutez! l'alcool", tips: "Petit tips : Inspirez brièvement après une gorgée. Plus la brûlure ressentie dans le fond de la gorge est forte, plus il y a d'alcool. On peut aussi regarder le titrage de la bouteille... Mais c'est d'la triche!!", wine_color: "Rouge")
# answer_53 = Answer.create!(question: question_13, value: "1", title: "léger", wine_color: "Rouge")
# answer_54 = Answer.create!(question: question_13, value: "2", title: "moyen", wine_color: "Rouge")
# answer_55 = Answer.create!(question: question_13, value: "3", title: "élevé", wine_color: "Rouge")
# question_14 = Question.create!(value: "Evaluez le niveau de tannins de ce vin :",typ:"gauge", theme: "Goutez! les tannins", tips: "Lorsque vous avez le vin en bouche, passez le sur les gencives. Plus les tannins seront présents plus vos gencives seront asséchées.", wine_color: "Rouge")
# answer_56 = Answer.create!(question: question_14, value: "1", title: "légers", wine_color: "Rouge")
# answer_57 = Answer.create!(question: question_14, value: "2", title: "moyens", wine_color: "Rouge")
# answer_58 = Answer.create!(question: question_14, value: "3", title: "puissants", wine_color: "Rouge")
# question_15 = Question.create!(value: "Evaluez le corps de ce vin :",typ:"gauge", theme: "Goutez! le corps", tips: "Le corps correspond au poids, au volume du vin en bouche. L'acidité diminuera le corps tandis que l'alcool et la douceur l'augmenteront", wine_color: "Rouge")
# answer_59 = Answer.create!(question: question_15, value: "1", title: "léger", wine_color: "Rouge")
# answer_60 = Answer.create!(question: question_15, value: "2", title: "moyen", wine_color: "Rouge")
# answer_61 = Answer.create!(question: question_15, value: "3", title: "charpenté", wine_color: "Rouge")
# question_16 = Question.create!(value: "Qui est le meurtrier?",typ:"suspect", theme: "Enquêtez", wine_color: "Rouge")
# answer_62 = Answer.create!(question: question_16, value: "Suspect n°1", wine_color: "Rouge")
# answer_63 = Answer.create!(question: question_16, value: "Suspect n°2", wine_color: "Rouge")
# answer_64 = Answer.create!(question: question_16, value: "Suspect n°3", wine_color: "Rouge")

# game_1 = Game.create!(wine_id: 1, game_category_id: 1)
# game_2 = Game.create!(wine_id: 2, game_category_id: 1)
# game_3 = Game.create!(wine_id: 3, game_category_id: 1)
# game_4 = Game.create!(wine_id: 4, game_category_id: 1)
# game_5 = Game.create!(wine_id: 5, game_category_id: 1)
# game_6 = Game.create!(wine_id: 6, game_category_id: 1)
# game_7 = Game.create!(wine_id: 7, game_category_id: 1)
# game_8 = Game.create!(wine_id: 8, game_category_id: 1)
# game_9 = Game.create!(wine_id: 9, game_category_id: 1)
# game_10 = Game.create!(wine_id: 10, game_category_id: 1)
# game_11 = Game.create!(wine_id: 11, game_category_id: 1)
# game_12 = Game.create!(wine_id: 12, game_category_id: 1)

# aroma_2 = Aroma.create!(name: "Citron", family: "Agrumes", sub_family: "Fruités")
# aroma_3 = Aroma.create!(name: "Pamplemousse", family: "Agrumes", sub_family: "Fruités")
# aroma_4 = Aroma.create!(name: "Orange", family: "Agrumes", sub_family: "Fruités")
# aroma_5 = Aroma.create!(name: "Citron vert", family: "Agrumes", sub_family: "Fruités")
# aroma_6 = Aroma.create!(name: "Combava", family: "Agrumes", sub_family: "Fruités")
# aroma_7 = Aroma.create!(name: "Bergamote", family: "Agrumes", sub_family: "Fruités")
# aroma_8 = Aroma.create!(name: "Fraise", family: "Fruits rouges", sub_family: "Fruités")
# aroma_9 = Aroma.create!(name: "Framboise", family: "Fruits rouges", sub_family: "Fruités")
# aroma_10 = Aroma.create!(name: "Cerise", family: "Fruits rouges", sub_family: "Fruités")
# aroma_11 = Aroma.create!(name: "Groseille", family: "Fruits rouges", sub_family: "Fruités")
# aroma_12 = Aroma.create!(name: "Airelle", family: "Fruits rouges", sub_family: "Fruités")
# aroma_13 = Aroma.create!(name: "Cerise noire", family: "Fruits noirs", sub_family: "Fruités")
# aroma_14 = Aroma.create!(name: "Cassis", family: "Fruits noirs", sub_family: "Fruités")
# aroma_15 = Aroma.create!(name: "Mûre", family: "Fruits noirs", sub_family: "Fruités")
# aroma_16 = Aroma.create!(name: "Myrtille", family: "Fruits noirs", sub_family: "Fruités")
# aroma_17 = Aroma.create!(name: "Ananas", family: "Fruits exotiques", sub_family: "Fruités")
# aroma_18 = Aroma.create!(name: "Banane", family: "Fruits exotiques", sub_family: "Fruités")
# aroma_19 = Aroma.create!(name: "Fruits de la passion", family: "Fruits exotiques", sub_family: "Fruités")
# aroma_20 = Aroma.create!(name: "Grenade", family: "Fruits exotiques", sub_family: "Fruités")
# aroma_21 = Aroma.create!(name: "Letchi", family: "Fruits exotiques", sub_family: "Fruités")
# aroma_22 = Aroma.create!(name: "Muscat", family: "Fruits blancs ou à pépins", sub_family: "Fruités")
# aroma_23 = Aroma.create!(name: "Mangue", family: "Fruits exotiques", sub_family: "Fruités")
# aroma_24 = Aroma.create!(name: "Melon", family: "Fruits blancs ou à pépins", sub_family: "Fruités")
# aroma_25 = Aroma.create!(name: "Abricot", family: "Fruits à noyau", sub_family: "Fruités")
# aroma_26 = Aroma.create!(name: "Pèche", family: "Fruits à noyau", sub_family: "Fruités")
# aroma_27 = Aroma.create!(name: "Mirabelle", family: "Fruits à noyau", sub_family: "Fruités")
# aroma_28 = Aroma.create!(name: "Pomme", family: "Fruits blancs ou à pépins", sub_family: "Fruités")
# aroma_29 = Aroma.create!(name: "Poire", family: "Fruits blancs ou à pépins", sub_family: "Fruités")
# aroma_30 = Aroma.create!(name: "Coing", family: "Fruits blancs ou à pépins", sub_family: "Fruités")
# aroma_31 = Aroma.create!(name: "Amande fraiche", family: "Fruits secs", sub_family: "Fruités")
# aroma_32 = Aroma.create!(name: "Noix", family: "Fruits secs", sub_family: "Fruités")
# aroma_33 = Aroma.create!(name: "Noisette", family: "Fruits secs", sub_family: "Fruités")
# aroma_34 = Aroma.create!(name: "Noix de coco", family: "Fruits secs", sub_family: "Fruités")
# aroma_35 = Aroma.create!(name: "Pruneaux", family: "Fruits secs", sub_family: "Fruités")
# aroma_36 = Aroma.create!(name: "Raisins secs", family: "Fruits secs", sub_family: "Fruités")
# aroma_37 = Aroma.create!(name: "Menthe", family: "Herbe aromatiques", sub_family: "Végétaux")
# aroma_38 = Aroma.create!(name: "Eucalyptus", family: "Herbe aromatiques", sub_family: "Végétaux")
# aroma_39 = Aroma.create!(name: "Fenouil", family: "Herbe aromatiques", sub_family: "Végétaux")
# aroma_40 = Aroma.create!(name: "Anis", family: "Herbe aromatiques", sub_family: "Végétaux")
# aroma_41 = Aroma.create!(name: "Thym", family: "Herbe aromatiques", sub_family: "Végétaux")
# aroma_42 = Aroma.create!(name: "Herbe coupée", family: "Végétaux", sub_family: "Végétaux")
# aroma_43 = Aroma.create!(name: "Plantes médicinales", family: "Végétaux", sub_family: "Végétaux")
# aroma_44 = Aroma.create!(name: "Cèdre", family: "Végétaux", sub_family: "Végétaux")
# aroma_45 = Aroma.create!(name: "Pin", family: "Végétaux", sub_family: "Végétaux")
# aroma_46 = Aroma.create!(name: "Térebenthine", family: "Végétaux", sub_family: "Végétaux")
# aroma_47 = Aroma.create!(name: "Tabac", family: "Végétaux", sub_family: "Végétaux")
# aroma_48 = Aroma.create!(name: "Champignon", family: "Végétaux", sub_family: "Végétaux")
# aroma_49 = Aroma.create!(name: "Truffe", family: "Végétaux", sub_family: "Végétaux")
# aroma_50 = Aroma.create!(name: "Foin", family: "Végétaux", sub_family: "Végétaux")
# aroma_51 = Aroma.create!(name: "Sous-bois", family: "Végétaux", sub_family: "Végétaux")
# aroma_52 = Aroma.create!(name: "Poivron vert", family: "Légumes", sub_family: "Végétaux")
# aroma_53 = Aroma.create!(name: "Petit pois", family: "Légumes", sub_family: "Végétaux")
# aroma_54 = Aroma.create!(name: "Haricot vert", family: "Légumes", sub_family: "Végétaux")
# aroma_55 = Aroma.create!(name: "Olive noire", family: "Légumes", sub_family: "Végétaux")
# aroma_56 = Aroma.create!(name: "Olive verte", family: "Légumes", sub_family: "Végétaux")
# aroma_57 = Aroma.create!(name: "Chou", family: "Légumes", sub_family: "Végétaux")
# aroma_58 = Aroma.create!(name: "Cannelle", family: "Epices douces", sub_family: "Epicés")
# aroma_59 = Aroma.create!(name: "Vanille", family: "Epices douces", sub_family: "Epicés")
# aroma_60 = Aroma.create!(name: "Gingembre", family: "Epices douces", sub_family: "Epicés")
# aroma_61 = Aroma.create!(name: "Clou de girofle", family: "Epices douces", sub_family: "Epicés")
# aroma_62 = Aroma.create!(name: "Noix de muscade", family: "Epices douces", sub_family: "Epicés")
# aroma_63 = Aroma.create!(name: "Poivre", family: "Epices fortes", sub_family: "Epicés")
# aroma_64 = Aroma.create!(name: "Safran", family: "Epices fortes", sub_family: "Epicés")
# aroma_65 = Aroma.create!(name: "Réglisse", family: "Epices fortes", sub_family: "Epicés")
# aroma_66 = Aroma.create!(name: "Genièvre", family: "Epices fortes", sub_family: "Epicés")
# aroma_67 = Aroma.create!(name: "Cuir", family: "Animaux", sub_family: "Animaux")
# aroma_68 = Aroma.create!(name: "Viande", family: "Animaux", sub_family: "Animaux")
# aroma_69 = Aroma.create!(name: "Ecurie", family: "Animaux", sub_family: "Animaux")
# aroma_70 = Aroma.create!(name: "Musc", family: "Animaux", sub_family: "Animaux")
# aroma_71 = Aroma.create!(name: "Pipi de chat", family: "Animaux", sub_family: "Animaux")
# aroma_72 = Aroma.create!(name: "Pain grillé", family: "Grillés", sub_family: "Grillés")
# aroma_73 = Aroma.create!(name: "Chocolat", family: "Grillés", sub_family: "Grillés")
# aroma_74 = Aroma.create!(name: "Caramel", family: "Grillés", sub_family: "Grillés")
# aroma_75 = Aroma.create!(name: "Amande grillée", family: "Grillés", sub_family: "Grillés")
# aroma_76 = Aroma.create!(name: "Noisette grillée", family: "Grillés", sub_family: "Grillés")
# aroma_77 = Aroma.create!(name: "Café", family: "Grillés", sub_family: "Grillés")
# aroma_78 = Aroma.create!(name: "Note fumée", family: "Grillés", sub_family: "Grillés")
# aroma_79 = Aroma.create!(name: "Essence", family: "Minéraux", sub_family: "Minéraux")
# aroma_80 = Aroma.create!(name: "Pierre à fusil", family: "Minéraux", sub_family: "Minéraux")
# aroma_81 = Aroma.create!(name: "Silex", family: "Minéraux", sub_family: "Minéraux")
# aroma_82 = Aroma.create!(name: "Caoutchouc", family: "Minéraux", sub_family: "Minéraux")
# aroma_83 = Aroma.create!(name: "Iode", family: "Minéraux", sub_family: "Minéraux")
# aroma_84 = Aroma.create!(name: "Levure", family: "Patissiers", sub_family: "Patissiers")
# aroma_85 = Aroma.create!(name: "Pain", family: "Patissiers", sub_family: "Patissiers")
# aroma_86 = Aroma.create!(name: "Brioche", family: "Patissiers", sub_family: "Patissiers")
# aroma_87 = Aroma.create!(name: "Biscuit", family: "Patissiers", sub_family: "Patissiers")
# aroma_88 = Aroma.create!(name: "Beurre", family: "Animaux", sub_family: "Animaux")
# aroma_89 = Aroma.create!(name: "Lait", family: "Animaux", sub_family: "Animaux")
# aroma_90 = Aroma.create!(name: "Yaourt", family: "Animaux", sub_family: "Animaux")
# aroma_91 = Aroma.create!(name: "Crème", family: "Animaux", sub_family: "Animaux")
# aroma_92 = Aroma.create!(name: "Rose", family: "Floraux", sub_family: "Floraux")
# aroma_93 = Aroma.create!(name: "Violette", family: "Floraux", sub_family: "Floraux")
# aroma_94 = Aroma.create!(name: "Jasmin", family: "Floraux", sub_family: "Floraux")
# aroma_95 = Aroma.create!(name: "Miel", family: "Floraux", sub_family: "Floraux")
# aroma_96 = Aroma.create!(name: "Acacia", family: "Floraux", sub_family: "Floraux")
# aroma_97 = Aroma.create!(name: "Tilleul", family: "Floraux", sub_family: "Floraux")
# aroma_98 = Aroma.create!(name: "Sureau", family: "Floraux", sub_family: "Floraux")
# aroma_99 = Aroma.create!(name: "Camomille", family: "Floraux", sub_family: "Floraux")
# aroma_100 = Aroma.create!(name: "Pivoine", family: "Floraux", sub_family: "Floraux")


# @aromas = Aroma.all
# @aromas.each do |aroma|
#   # Answer.create!(question_id: 2, value: aroma.name, wine_color: "Blanc")
#   Answer.create!(question_id: 10, value: aroma.name, wine_color: "Rouge")
# end


# category3 = GameCategory.create!(category: "Enquête pro")
wines = Wine.all
wines.each do |wine|
  Game.create!(wine_id: wine.id, game_category_id: 3)
end


