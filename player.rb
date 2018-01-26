class Player
  attr_accessor :name, :answer_play, :numberjoueur

 #a l'initialisation d'une instance de la case joueur, on demande au joueur de rentrer son prenom
  def initialize(number_player) 
	puts "  - Hey! #{number_player}, c'est quoi ton petit nom ? "
	@name = gets.chomp.capitalize
	puts "  - Ok #{@name} t'es pret ? "
	puts " "
  end

 #fonction pour demander quelle coordonnee de case le joueur veux jouer
 #enregistre la reponse du joueur dans la variable @answer_play qu'on retourne ensuite  
  def ask_play 
	puts "  - Bon, tu joues quoi #{@name} ? je n'est pas que ca a faire !!! (Donne les coordonnees, ex : a1, b3, c2, etc.) "
	@answer_play = gets.chomp 	
  end

 #fonction pour verifier que les coordonnees du joueur correspondent au coordonnees du jeu
 #si la reponse de l'utilisateur @answerplay est bien comprise dans notre tableau coordonnees alors la fonction retourne true	
  def verification_coordonnees 
	coordonnees = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
	true if coordonnees.include? @answer_play 
  end
 
 #phrase qui sert a enregistrer le choix de case du joueur
  def success_case
	puts "  - Ok #{@name}, c'est ton choix #{@answer_play}"  
	puts " "
  end

 #phrase lorsque le joueur fais un choix de case impossible
  def error
	puts "  - Dis donc #{@name}, tu vois pas que c'est pas possible ?!? Allez rejoue !  "
	puts " "
  end

 #phrase lorsque le joueur a gagne
  def winner
	puts "  - WoooW #{@name} !!!! Tu m'impressionne, Tu as gagne !!! "
	puts " "
  end
end