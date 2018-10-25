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

  private

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end

end