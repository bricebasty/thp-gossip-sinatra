# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'gossip'

# Commenter avec cette classe
class Comment < Gossip
  attr_accessor :author, :content, :gossip

  CSV_PATH = 'db/comment.csv'

  def initialize(author, content, gossip)
    super(author, content)
    @gossip = gossip
  end

  def self.all
    CSV.foreach(CSV_PATH).map do |row|
      new(row[1], row[2], row[0].to_i)
    end
  end

  def save
    CSV.open(CSV_PATH, 'ab') do |csv|
      csv << [@gossip, @author, @content]
    end
  end
end
