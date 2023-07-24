# frozen_string_literal: true

require 'bundler'
Bundler.require

# Model of the app
class Gossip
  attr_accessor :author, :content, :gossip

  CSV_PATH = 'db/gossip.csv'

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open(CSV_PATH, 'ab') do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    CSV.foreach(CSV_PATH).map do |row|
      new(row[0], row[1])
    end
  end

  def self.update(id, content)
    data = CSV.read(CSV_PATH)
    data[id][1] = content

    CSV.open(CSV_PATH, 'w') do |csv|
      data.each do |row|
        csv << row
      end
    end
  end

  def self.delete_self(number)
    # Mets toutes les données du CSV dans une variable
    data = CSV.read('db/gossip.csv')
    # Enlève la ligne que l'on a spécifié dans la variable
    data.delete_at(number - 1)
    # Ecris dans le csv la data modifiée
    CSV.open('db/gossip.csv', 'w') do |csv|
      data.each do |row|
        csv << row
      end
    end
  end
end
