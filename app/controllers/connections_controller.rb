class ConnectionsController < ApplicationController
  def new
    @connection = Connection.new
  end

  def create
    @connection = Connection.new(connection_params)
    if @connection.save
      redirect_to connections_path
    else
      render 'edit'
    end
  end

  def edit
    @connection = Connection.find(params[:id])
  end

  def update
    @connection = Connection.find(params[:id])
    @connection.update(connection_params)
    if @connection.save
      redirect_to connection_path(@connection)
    else
      render 'edit'
    end
  end

  def index
    @connections = Connection.all.to_a
  end

  def show
    @connection = Connection.find(params[:id])
  end

  private
  def connection_params
    params.require(:connection).permit(:first_name, :last_name, :connection_type, :last_contact)
  end
end
