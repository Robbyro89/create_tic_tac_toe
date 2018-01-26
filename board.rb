class Board
 #les lignes du plateau qui ne sont pas modifiables
  attr_reader :o, :a, :c, :d, :f, :g, :i
 #les lignes du plateau qui sont modifiable
  attr_accessor :b, :e, :h, :a_1, :a_2, :a_3, :b1, :b2, :b3, :c1, :c2, :c3 

 #a l'initialisation d'un board, on lui attribue 9 variables qui sont inserees dans chacun des compartiments et qui sont modifiables
  def initialize(a_1, a_2, a_3, b_1, b_2, b_3, c_1, c_2, c_3) 
    @a_1 = a_1
    @a_2 = a_2
    @a_3 = a_3
    @b_1 = b_1
    @b_2 = b_2
    @b_3 = b_3
    @c_1 = c_1
    @c_2 = c_2
    @c_3 = c_3
 
 #voir sur la console pour comprendre le format
 #on insere les variables, qui seront modifiables, dans chacun des compartiments du board
    @o = "          1   2   3   "
    @a = "            |   |     "
    @b = "      a   " + @a_1 +" | "+ @a_2 +" | " + @a_3
    @c = "         ___|___|___  "
    @d = "            |   |     "
    @e = "      b   " + @b_1 +" | "+ @b_2 +" | " + @b_3 
    @f = "         ___|___|___  "
    @g = "            |   |     "
    @h = "      c   " + @c_1 +" | "+ @c_2 +" | " + @c_3 
    @i = "            |   |     "

  end

  def display #fonction pour afficher le board - on affiche toutes les lignes qui le composent
    puts @o
    puts @a
    puts @b
    puts @c
    puts @d
    puts @e
    puts @f
    puts @g
    puts @h
    puts @i 
    puts " "
  end
end