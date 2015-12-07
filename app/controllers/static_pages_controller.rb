class StaticPagesController < ApplicationController
  def self.search(search)
    where("title LIKE ?", "%#{search}%") 
  end
end
