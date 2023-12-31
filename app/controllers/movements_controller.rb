class MovementsController < ApplicationController
  before_action :set_movement, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /movements or /movements.json
  def index
    @movements = Movement.all
    @group = Group.find(params[:group_id])
    @movements = @movements.where(author_id: current_user.id)
  end

  # GET /movements/1 or /movements/1.json
  def show; end

  # GET /movements/new
  def new
    @groups = current_user.groups

    @group = Group.find(params[:group_id])
    @movement = @group.movements.new

    @group_id = params[:group_id]
  end

  # GET /movements/1/edit
  def edit; end

  # POST /movements or /movements.json
  def create
    @group = Group.find(params[:group_id])
    @movement = @group.movements.new(movement_params)
    @movement.author_id = current_user.id

    respond_to do |format|
      if @movement.save
        format.html { redirect_to group_path(@group), notice: 'Movement was successfully created.' }
        format.json { render :show, status: :created, location: @movement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movements/1 or /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to movement_url(@movement), notice: 'Movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @movement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movements/1 or /movements/1.json
  def destroy
    @group = Group.find(params[:group_id])
    @movement = @group.movements.find(params[:id])

    @movement.destroy
    respond_to do |format|
      format.html { redirect_to group_url(@group), notice: 'Movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movement
    @movement = Movement.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movement_params
    params.require(:movement).permit(:author_id, :name, :amount, :group_id)
  end
end
