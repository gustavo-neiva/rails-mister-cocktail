class DosesController < ApplicationController
  def create
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    if @dose.save
      redirect_to dose_path(@dose)
    else
      render :new
    end
  end

  private

  def doses_params
    params.require(:doses).permit(:description)
  end
end
