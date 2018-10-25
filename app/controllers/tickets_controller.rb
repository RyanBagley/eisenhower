class TicketsController < ApplicationController

  before_action :set_ticket, only: [:edit, :update, :show, :destroy]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:notice] = "Ticket was created successfully!"
      redirect_to ticket_path(@ticket)
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket was updated successfully"
      redirect_to ticket_path(@ticket)
    else
      render 'edit'
    end
  end

  def index
    @tickets = Ticket.all
  end

  def destroy

    @ticket.destroy
    flash[:notice] = "Ticket was deleted successfully"
    redirect_to tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end

end