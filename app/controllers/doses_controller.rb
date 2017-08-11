class DosesController < ApplicationController

  def new
    @dose = Dose.new(doses_params)
  end

  def create
    @dose = Dose.new(doses_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      redirect_to cocktail_path(@dose.cocktail)
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:description, :photo, :photo_cache)
  end
end
