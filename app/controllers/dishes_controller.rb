# app/controllers/dishes_controller.rb
class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  def index
    @dishes = Dish.all
    puts "Dishes: #{Dish.all.inspect}"
  end

  def show
    # The set_dish before_action ensures @dish is set
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    puts "Dish params: #{dish_params.inspect}"
    puts "I'm trying to see if sqllite3 works."
    puts @dish.inspect
    puts Dish.all.inspect

    if @dish.save
      flash[:success] = 'Dish successfully submitted!'
      redirect_to root_path
    else
      render 'welcome/index'
    end
  end

  def edit
    # The set_dish before_action ensures @dish is set
  end

  def update
    if @dish.update(dish_params)
      flash[:success] = 'Dish successfully updated!'
      redirect_to dish_path(@dish)
    else
      render 'edit'
    end
  end

  def destroy
    @dish.destroy
    flash[:success] = 'Dish successfully deleted!'
    redirect_to dishes_path
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :dish, :comments)
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end
end
