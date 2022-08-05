class HerosController < ApplicationController

    def index
        heros = Hero.all;
        render json: heros
    end

    def create
        hero = Hero.create(hero_params)
        if hero.valid?
            render json: hero 
        else 
            render json: hero.errors, status: 422
        
    end

    def update
        hero = Hero.find(params[:id])
        hero.update(hero_params)
        if hero.valid
            render json: hero  
        else
            render json: hero.errors, status: 422  
    end

    def destroy
        hero = Hero.find(params[:id])
        hero.destroy
        render json: hero
    end

    private
    def hero_params
        params.require(:hero).permit(:name, :age, :enjoys, :image)
    end

end
