require_relative 'board.rb'
require_relative 'board_case.rb'
require_relative 'player.rb'

class Game  
  attr_accessor :first_player, :second_player, :choice_player1, :choice_player2,  :array, :another_answer
  attr_reader :the_board, :victory

 #a l'initialisation d'un Game, on cree deux joueurs, on cree un board et on lance la fonction qui entame le jeu
  def initialize 
	@first_player = Player.new("joueur 1")
	@second_player = Player.new("joueur 2")
	  self.create_board
	  self.play_until_victory
  end

 #on cree neuf instances de Cases qui ont chacune un nom et une valeur " " car au debut du jeu, elles sont vides
  def create_board
	@a1 = Cases.new("a1", " ") 
	@a2 = Cases.new("a2", " ")
	@a3 = Cases.new("a3", " ")
	@b1 = Cases.new("b1", " ")
	@b2 = Cases.new("b2", " ")
	@b3 = Cases.new("b3", " ")
	@c1 = Cases.new("c1", " ")
	@c2 = Cases.new("c2", " ")
	@c3 = Cases.new("c3", " ")

    puts "  ________________________________________________________________________________________________________  "
    puts " |  __       ___       __   ________   __          ________   ________       ___       ___       ________  | "
    puts " | l  l     l   l     l  l l  ______l l  l        l   _____l l   __   l     l   l     l   l     l  ______l | "
    puts " |  l  l   l  _  l   l  l  l  l__     l  l        l  l       l  l  l  l    l     l   l     l    l  l__     | "
    puts " |   l  l_l  l l  l_l  l   l   __l    l  l        l  l       l  l  l  l   l  l_l  l_l  l_l  l   l  ___l    | "
    puts " |    l     l   l     l    l  l_____  l  l_____   l  l_____  l  l__l  l  l  l   l     l   l  l  l  l_____  | "
    puts " |     l___l     l___l     l________l l________l  l________l l________l l__l     l___l     l__l l________l | "
    puts " |____________________________________________       TO      ______________________________________________| "
    puts " |                                             TIC  TAC  TOE                                               | "
    puts " |_________________________________________________________________________________________________________| "

 #On cree un Board et on definit ses 9 variables (voir Classe Board) comme etant la valeur de nos 9 cases, soit " "
 #on affiche un Board, qui sera vide
 #on cree un array avec toutes nos cases, qui sert a garder a jour les valeurs des cases au fur et a mesure de l'avancee du jeu
	@the_board = Board.new(@a1.position, @a2.position, @a3.position, @b1.position, @b2.position, @b3.position, @c1.position, @c2.position, @c3.position) 
	@the_board.display 
	@array = [@a1, @a2, @a3, @b1, @b2, @b3, @c1, @c2, @c3] 
  end

 #fonction pour mettre a jour le board a chaque tour
 #on cree un nouveau tableau avec les nouvelles valeurs de array (qui contient 9 cases)
 #on affiche le nouveau Board - soit le board mis a jour
  def update_board 
	@the_board = Board.new(array[0].position, array[1].position, array[2].position, array[3].position, array[4].position, array[5].position, array[6].position, array[7].position, array[8].position) 
	@the_board.display 
  end

 #fonction qui permet de passer en revue toutes les conditions de victoire, on verifie si elements de array (qui contient les cases mises a jour) sont identiques et differents de " "
 # ligne 61 a 76: traduction si a1 = a2 et a2 = a3 et a3 différent de " ", alors victoire !
  def check_if_victory 
	@victory = false 
	  case
	 	when array[0].position == @a1.position && array[1].position == array[2].position && array[2].position != " " 
	     @victory = true
		when array[3].position == array[4].position && array[4].position == array[5].position && array[5].position != " "
		 @victory = true
		when array[6].position == array[7].position && array[7].position == array[8].position && array[8].position != " "
		 @victory = true
		when array[0].position == array[3].position && array[3].position == array[6].position && array[6].position != " "
	     @victory = true
		when array[1].position == array[4].position && array[4].position == array[7].position && array[7].position != " "
		 @victory = true
		when array[2].position == array[5].position && array[5].position == array[8].position && array[8].position != " "
		 @victory = true
		when array[0].position == array[4].position && array[4].position == array[8].position && array[8].position != " "
		 @victory = true
		when array[2].position == array[4].position && array[4].position == array[6].position && array[6].position != " "
		 @victory = true
	  end
  end

 #fonction qui decrit comment le premier joueur joue
 #on lance la fonction ask_play qui demande au joueur une coordonnee de case et on le stock dans une variable
 #verification.coordonees et une fonction de Player qui verifie si les coordonnees sont bien ecrites 
 #si verification_coordonnees est false, on lance la fonction error qui affiche un message d'erreur
 #on relance ask_play pour demander au joueur une autre coordonnee
  def first_player_plays 
	@choice_player1 = first_player.ask_play 
	unless first_player.verification_coordonnees == true 
	       first_player.error 
	 	   @choice_player1 = first_player.ask_play
	end

 #pour chacun des elements du array stockant les cases
 #si le nom de la case = au choix du joueur et si la case et vide
 #changer la valeur de la case avec une petite croix
 #lance un message de succes (voir classe Player) qui dit que la case est bonne
 #si le nom de la case = au choix du joueur mais la case n'est pas vide
 #on lance la fonction error qui affiche un message d'erreur
 #on relance ask_play pour demander au joueur une autre coordonnee
	@array.map do |x| 
	  if x.value == @choice_player1 && x.check_if_empty
	     x.fill_up_case("x")
	     first_player.success_case
	  elsif x.value == @choice_player1 && !x.check_if_empty
		  first_player.error
		  @choice_player1 = first_player.ask_play
	  end
    end

 #on lance la fonction ci-dessous pour modifier le board selon le choix du joueur	
	update_board
 #on verifie si le joueur a gagne avec la fonction ci-dessous
	check_if_victory

 #si le joueur a gagne
 #on appelle la fonction winner (classer Player) qui affiche un message de victoire !
 #on lance la fonction ci-dessous qui demande a lancer un nouveau jeu
	  if @victory == true
	     first_player.winner 
	     another_game 
	  end
  end

 #exactement pareil que la methode pour le first_player
  def second_player_plays
	@choice_player2 = second_player.ask_play
	unless second_player.verification_coordonnees == true 
	  	   second_player.error
	 	   @choice_player2 = second_player.ask_play
	end

	@array.map do |x|
	  if x.value == @choice_player2 && x.check_if_empty
		 x.fill_up_case("o")
		 second_player.success_case
	  elsif x.value == @choice_player2 && !x.check_if_empty
			second_player.error
			@choice_player2 = second_player.ask_play
	  end	
	end

	update_board
	check_if_victory

	  if @victory == true 
		 second_player.winner
		 another_game 
	  end
  end

 #fonction qui decrit l'alternance entre le first_player et le second_player jusqu'a la victoire de l'un d'eux
  def play_until_victory 
	until victory == true 
		  first_player_plays
		  second_player_plays
	end
  end

 #fonction qui demande aux joueurs s'ils veulent rejouer une partie
  def another_game
  	puts "  ______________________________________"
  	puts " |--------------------------------------|"
	puts " |--||-- On s'en refait une ? o/n --||--|"
    puts " |--||----- Ou t'as la frousse -----||--|"
    puts " |______________________________________|"


  @another_answer = gets.chomp.downcase
 #si la reponse est oui
	if another_answer == "o"  
	puts "  ______________________________________"
  	puts " |--------------------------------------|"
	puts " |--||-------- C'est darty ---------||--|"
    puts " |--||---------- Mon Kiki ----------||--|"
    puts " |______________________________________|"

 #creation d'un nouveau board
 #on change la variable de victory a false
 #on relance une partie
	  create_board 
	  victory == false 
	  play_until_victory
 #sinon, message d'aurevoir et exit pour sortir du programme 
	else puts "  ______________________________________"
  	     puts " |--------------------------------------|"
	     puts " |--||-------- Allez degage --------||--|"
         puts " |--||--------- FROUSSARD ----------||--|"
         puts " |______________________________________|"
	  exit
	end
  end
end

mon_jeu = Game.new