require 'rails_helper'

RSpec.describe Hero, type: :model do
  it "should validate name" do
    hero = Hero.create(age:40, enjoys: 'Kickin butt', image:'https://images.unsplash.com/photo-1501432377862-3d0432b87a14?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')

    expect(hero.errors[:name]).to_not be_empty
  end

  it "should validate age" do
    hero = Hero.create(name: 'Bruce', enjoys: 'Kickin butt', image:'https://images.unsplash.com/photo-1501432377862-3d0432b87a14?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')

    expect(hero.errors[:age]).to_not be_empty
  end

  it "should validate enjoys" do
    hero = Hero.create(name: 'Bruce', age:40, image:'https://images.unsplash.com/photo-1501432377862-3d0432b87a14?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80')

    expect(hero.errors[:enjoys]).to_not be_empty
  end

  it "should validate image" do
    hero = Hero.create(name: 'Bruce', age:40, enjoys: 'Kickin butt')

    expect(hero.errors[:image]).to_not be_empty
  end

  it 'is not valid if enjoys is less than 10 characters' do
    hero = Hero.create name: 'Bruce', age:40, enjoys: 'Kickin', image: 'https://images.unsplash.com/photo-1501432377862-3d0432b87a14?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
    expect(hero.errors[:enjoys]).to_not be_empty
  end
end
