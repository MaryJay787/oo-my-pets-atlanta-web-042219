require "pry"

class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []

  def initialize(species)
    @species = species
    @pets = {:cats => [], :dogs => [], :fishes => []}
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    new = Fish.new(name)
    @pets[:fishes] << new
  end

  def buy_cat(name)
    new = Cat.new(name)
    @pets[:cats] << new
  end

  def buy_dog(name)
    new = Dog.new(name)
    @pets[:dogs] << new
  end

  def walk_dogs
    @pets[:dogs].select {|d| d.mood="happy"}
  end

  def play_with_cats
    @pets[:cats].select {|c| c.mood="happy"}
  end

  def feed_fish
    @pets[:fishes].select {|f| f.mood="happy"}
  end

  def sell_pets
    @pets.map do |k, v|
      v.select do |m|
        m.mood = "nervous"
      end
    end
    @pets.map {|a, b| b.clear}
  end

  def list_pets
    c = @pets[:cats].count
    d = @pets[:dogs].count
    f = @pets[:fishes].count
    "I have #{f} fish, #{d} dog(s), and #{c} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end
end
