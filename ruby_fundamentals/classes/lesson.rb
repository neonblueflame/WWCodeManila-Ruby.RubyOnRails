class Animal
  attr_reader :name

  # Implements
  #
  #  def name
  #    @name
  #  end

  # We also have
  # attr_writer (for writing to instance variables)
  # attr_accessor (for both reading and writing)

  def initialize(name, gender)
    # @variables are instance variables
    # They are used to store data needed by the class
    @name = name
    @gender = gender
  end
  
  # Called if method called by subclass doesn't exists
  # Prone to bugs because it's part of ruby core
  def method_missing(method_name, *args, &block)
      if [:swim, :climb, :address].include? method_name
        puts "I can't do #{method_name}"
      else
         super
      end
  end
  
  # Corresponding method with method_missing
  def respond_to_missing?(method_name, *args)
    super
  end
    
  def specie
    # If nemo calls, nemo.specie
    # self is nemo
    self.class.name
  end

  def greet
    puts "Hello, my name is #{name}. I live in #{address}"
    puts "I am a #{specie}"
  end

  private

  # Cannot access methods under private

  def address
    'The sea'
  end
end

class Fish < Animal
  def swim
    'Keep swimming'
  end
end

nemo = Animal.new('Nemo', :male)
dory = Animal.new('Dory', :female)

nemo.greet
p nemo.specie
p nemo.address
p nemo.swim
p nemo.respond_to? :swim

nemo_fish = Fish.new('Nemo Fish', :male)
dory_fish = Fish.new('Dory Fish', :female)

nemo_fish.greet
p nemo_fish.specie
p nemo_fish.address
p nemo_fish.swim
