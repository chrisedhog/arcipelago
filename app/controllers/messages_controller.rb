class MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy, :change_unread]

  # GET /messages
  # GET /messages.json
    
  def index
      @messages = Message.messages_to_me(current_user.id).reverse_order
#      @messages = Message.order(created_at: :desc).where(receiver_id: current_user)
      @mymsgs = Message.messages_to_me(current_user.id).unread.count
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
      if (@message.receiver_id == current_user.id)
          @message.update_attributes(read: true)
      end
  end   
    
    def change_unread
        @message.update_attributes(read: false)
        redirect_to messages_path
    end

  # GET /messages/new
  def new
    @message = Message.new
    @receiver_profile = User.find(params[:receiver]).profile
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id

    respond_to do |format|
      if @message.save
          format.html { redirect_to profile_path(User.find(@message.receiver_id).profile), notice: 'Message was successfully sent.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:sender_id, :receiver_id, :subject, :body, :read)
    end
end