class HomeController < ApplicationController
    def index
        @recipe = Recipe.find_random
    end
end
