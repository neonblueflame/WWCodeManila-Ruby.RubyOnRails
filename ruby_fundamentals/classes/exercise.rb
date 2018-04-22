# Create a new animal specie that inherits from Animal class
#
# Implement `diet` and `eat` methods.

class Food
  attr_reader :name, :food_type

  def initialize(name, food_type)
    # Possible values
    # - plant
    # - meat
    if food_type.instance_of? Symbol and [:plant, :meat].include? food_type
      @name = name
      @food_type = food_type
    else
      puts "#{name} is a type of #{food_type}. Please enter plant or meat types of food, and in Symbol"
    end
  end
  
end

class Animal
  attr_reader :name
  
  HERBIVORE = :herbivore
  CARNIVORE = :carnivore
  OMNIVORE = :omnivore
  
  FOOD_DIET = {HERBIVORE => [:plant], CARNIVORE => [:meat], OMNIVORE => [:plant, :meat]}
  
  def initialize(name)
    @name = name
    puts "Hi! My name is #{name}. I'm a type of #{self.class.name}"
    
    begin
      
      if [HERBIVORE, CARNIVORE, OMNIVORE].include? diet
        puts "#{self.class.name} is a type of #{diet}"
      else
        puts "#{self.class.name} can't be a type of #{diet}"
      end
      
    rescue NotImplementedError
      puts "Please define #{name}'s diet"
    end
    
  end

  def diet
    # Possible values:
    # - herbivore
    # - carnivore
    # - omnivore
    #
    # HINT: Each animal only fall to one of these types
    raise NotImplementedError
  end

  def eat(food)
    # Implement this method
    #
    # If animal can eat the food, return 'Yummy! Thank you for <food name>!'.
    # Otherwise, return 'Sorry, I cannot eat <food name>'
    #
    # Note:
    # - Herbivore: eats plant-based food only
    # - Carnivore: eats meat-based food only
    # - Omnivore: eats both plant-based and meat-based food
    #raise NotImplementedError
    
    if !diet.instance_of? Symbol
      puts "Diet should be a Symbol"
      return
    end
    
    if FOOD_DIET[diet].include? food.food_type
      puts "Yummy! Thank you for #{food.name}!"
    elsif food.name.nil?
      puts "Please don't feed me nothing :("
    else
      puts "Sorry, I cannot eat #{food.name} because it is a #{food.food_type}"
    end
    
  end
end

class Cat < Animal  
  def diet
    CARNIVORE
  end
end

class Fish < Animal
  def diet
    HERBIVORE
  end
end

class Human < Animal
  def diet
    OMNIVORE
  end
end

# Example:
# plankton = Food.new('plankton', 'plant')
# nemo.eat(plankton)
cat_food = Food.new("Cat food", :meat)
plankton = Food.new("Plankton", :plant)
cellphone = Food.new("Samsung S8", :gadget )

hanger = Cat.new("Hanger")
hanger.eat(cat_food)
hanger.eat(plankton)
hanger.eat(cellphone)

nemo = Fish.new("Nemo")
nemo.eat(cat_food)
nemo.eat(plankton)

patty = Human.new("Patty")
patty.eat(cat_food)
patty.eat(plankton)