#Dominic Sina 11-111-507
module Warmup

  class Item

    @@items = Array.new

    # generate getter and setter for name and grades
    attr_accessor :name, :price, :status, :owner

    # factory method (constructor) on the class
    # @param name[String], price[int], owner[User]
    def self.create(name, price, owner)
      item = self.new
      item.name = name
      item.price = price
      item.owner = owner
      item.save()
      item
    end

    # initialize is called automatically
    # when an instance is created
    def initialize
      self.status = 'inactive'
    end

    def self.all
      @@items
    end

    def self.by_name name
      @@items.detect {|item| item.name == name }
    end

    # add the instance to the list of students
    def save
      @@items.push self
    end


    #Checks if this item can be bought with
    #this amount of credits to spend
    def enough_money?(maxAmount)
      self.price<=maxAmount
    end

    def to_s
      "#{self.name} #{self.price}$"
    end
  end

end