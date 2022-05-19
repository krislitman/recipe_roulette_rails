class HomeController < ApplicationController
    def index
        @recipe = Recipe.find_random
        require 'pry'; binding.pry
    end
end
