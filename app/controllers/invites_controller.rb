class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  # GET /invites
  # GET /invites.json
  def index
    @event = Event.find(params[:event_id])
    @invites = @event.invites.all
  end

  def my_invites
    @invites = Invite.where(recipient: current_user)
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
  end

  # GET /invites/new
  def new
    @event = Event.find(params[:event_id])
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites
  # POST /invites.json
  def create
    @event = Event.find(params[:event_id])
    @invite = Invite.new(invite_params)
    @invite.event = @event

    @invite.sender_id = current_user.id

    if User.where(email: "#{@invite.email}").first
      @invite.recipient_id = User.where(email: "#{@invite.email}").first.id
    end

    respond_to do |format|
      if @invite.save
        format.html { redirect_to event_invites_path, notice: 'Invite was successfully created.' }
        format.json { render :show, status: :created, location: @invite }
      else
        format.html { render :new }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invites_url, notice: 'Invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_params
      params.require(:invite).permit(:sender_id, :recipient_id, :event_id, :email)
    end
end
