class TicketsController < ApplicationController

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
    @ticket = Ticket.find(params[:id])
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
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
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    flash[:notice] = "Ticket was deleted successfully"
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end

end