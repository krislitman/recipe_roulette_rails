class HomeController < ApplicationController
    def index
        @random_recipe = Recipe.find_random
    end
end
