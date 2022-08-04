require 'rails_helper'

RSpec.describe "Hero", type: :request do
  describe "GET /index" do
    it "gets a list of heros" do
      Hero.create(
        name: "Gamora",
        age: 29,
        enjoys: "Listening to 70's jams while cruising through the galaxy",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQay-ueFvf3PjCBaFyJJUTkDNFHXwo6lFRVmA&usqp=CAU"
      )

      get '/heros/'
      hero = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(hero.length).to eq 1
    end
  end


  describe "POST /create" do
    it "creates a hero" do
      hero_params = {
        hero: {
          name: "Gamora",
          age: 29,
          enjoys: "Listening to 70's jams while cruising through the galaxy",
          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQay-ueFvf3PjCBaFyJJUTkDNFHXwo6lFRVmA&usqp=CAU"
        }
      }

      post '/heros', params: hero_params
      expect(response).to have_http_status(200)
      hero = Hero.first
      expect(hero.name).to eq "Gamora"
      expect(hero.age).to eq 29
      expect(hero.enjoys).to eq "Listening to 70's jams while cruising through the galaxy"
      expect(hero.image).to eq "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQay-ueFvf3PjCBaFyJJUTkDNFHXwo6lFRVmA&usqp=CAU"
    end
  end


  describe "PATCH /update" do
    it "updates a hero" do
      hero_params = {
        hero: {
          name: "Gamora",
          age: 29,
          enjoys: "Listening to 70's jams while cruising through the galaxy",
          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQay-ueFvf3PjCBaFyJJUTkDNFHXwo6lFRVmA&usqp=CAU"
        }
      }

      post '/heros', params: hero_params
      hero = Hero.first
      updated_hero_params = {
        hero: {
          name: "Gamora",
        age: 30,
        enjoys: "Listening to 70's jams while cruising through the galaxy",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQay-ueFvf3PjCBaFyJJUTkDNFHXwo6lFRVmA&usqp=CAU"
        }
      }

      patch "/heros/#{hero.id}", params: updated_hero_params
      updated_hero = Hero.find(hero.id)
      expect(response).to have_http_status(200)
      expect(updated_hero.age).to eq 30
    end
  end


  describe "DELETE /destroy" do
    it "deletes a hero" do
      hero_params = {
        hero: {
          name: "Gamora",
          age: 29,
          enjoys: "Listening to 70's jams while cruising through the galaxy",
          image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQay-ueFvf3PjCBaFyJJUTkDNFHXwo6lFRVmA&usqp=CAU"
        }
      }

      post '/heros', params: hero_params
      hero = Hero.first
      delete "/heros/#{hero.id}"
      expect(response).to have_http_status(200)
      heros = Hero.all;
      expect(heros).to be_empty
    end
  end 

end
