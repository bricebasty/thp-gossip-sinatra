# frozen_string_literal: true

require 'bundler'
Bundler.require

# Shows to the user things
class View
  def create_gossip
    puts "\nCrée un gossip"
    puts "\nMets ton nom"
    input1 = gets.chomp
    puts "\nMets ton super gossip"
    input2 = gets.chomp
    [input1, input2]
  end

  def index_gossip(all_gossips)
    iterator = 1
    all_gossips.each do |gossip|
      puts "\n#{iterator}. #{gossip.author} a dit #{gossip.content}"
      iterator += 1
    end
  end

  def delete_gossip
    puts "\nDis moi le gossip que tu veux supprimer ! (ne prend que des nombres entiers)"
    gets.chomp.to_i
  end
end
