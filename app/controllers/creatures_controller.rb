class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
  end

  def new
    @creature = Creature.new
  end

  def create
    creature_params
    creature = Creature.new(creature_params)
    if creature.save
      redirect_to creature_path(creature)
    end
  end

  def show
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
  end

  def edit
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
  end

  def update
    ## get creature id and save to variable
    creature_id = params[:id]
    ## find creature by id
    creature = Creature.find_by_id(creature_id)
    ## whitelist params and save to variable
    creature_params
    ## update creature using update_attributes method, pass in creature params to grab updated info
    creature.update_attributes(creature_params)
    ## redirect to show page for the updated creature
    redirect_to creature_path(creature)
  end

  private

  def creature_params
     params.require(:creature).permit(:name, :description)
  end

end
