class GuestshipsController < ApplicationController
  before_action :set_guestship, only: [:show, :edit, :update, :destroy]

  # GET /guestships
  # GET /guestships.json
  def index
    @event = Event.find(params[:event_id])
    @guestships = @event.guestships.all
  end

  # GET /guestships/1
  # GET /guestships/1.json
  def show
  end

  # GET /guestships/new
  def new
    @event = Event.find(params[:event_id])
    @guestship = Guestship.new
  end

  # GET /guestships/1/edit
  def edit
  end

  # POST /guestships
  # POST /guestships.json
  def create
    @event = Event.find(params[:event_id])
    @guestship = Guestship.create(guestship_params)
    @guestship.event = @event
    if User.where(email: "#{@guestship.email}").first
      @guestship.user_id = User.where(email: "#{@guestship.email}").first.id
    end



    respond_to do |format|
      if @guestship.save && @guestship.user
        format.html { redirect_to event_guestships_path, notice: 'Guestship was successfully created.' }
        format.json { render :show, status: :created, location: @guestship }
      else
        format.html { render :new }
        format.json { render json: @guestship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guestships/1
  # PATCH/PUT /guestships/1.json
  def update
    respond_to do |format|
      if @guestship.update(guestship_params)
        format.html { redirect_to @guestship, notice: 'Guestship was successfully updated.' }
        format.json { render :show, status: :ok, location: @guestship }
      else
        format.html { render :edit }
        format.json { render json: @guestship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guestships/1
  # DELETE /guestships/1.json
  def destroy
    @guestship.destroy
    respond_to do |format|
      format.html { redirect_to guestships_url, notice: 'Guestship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guestship
      @guestship = Guestship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guestship_params
      params.require(:guestship).permit(:event_id, :email)
    end
end
