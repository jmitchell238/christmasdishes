# app/controllers/dishes_controller.rb
class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      flash[:success] = 'Dish successfully submitted!'
      redirect_to root_path
    else
      render 'welcome/index'
    end
  end

  def edit
    @dish = Dish.find(params[:id])
  end

  def update
    if @dish.update(dish_params)
      flash[:success] = 'Dish successfully updated!'
      redirect_to dish_path(@dish)
    else
      render 'edit'
    end
  end

  def delete
    @dish = Dish.find(params[:id])

    puts "I'm trying to delete a dish."
    @dish.destroy
  end

  def destroy
    @dish = Dish.find(params[:id])

    puts "I'm trying to destroy a dish."
    if @dish.destroy
      puts "I'm trying to destroy a dish."
      redirect_to welcome_index_path, notice: 'Dish deleted.'
    else
      redirect_to welcome_index_path, notice: 'Dish could not be deleted.'
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :dish, :comments)
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end
end
