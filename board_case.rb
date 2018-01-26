class Cases
  attr_accessor :value, :position

 #une case a un nom a1, a2, etc. et une valeur qui est " ", "x" ou "o"
  def initialize(value, position) 
	@value = value
	@position = position		
  end

 #fonction pour changer la valeur de la case et y mettre ce qu'on veut 
  def fill_up_case(pion) 		
	self.position = pion
  end

 #fonction pour verifier si la case est deja remplie ou non
  def check_if_empty
	true if self.position == " " 		
  end
end