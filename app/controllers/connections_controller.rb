class ConnectionsController < ApplicationController
  def new
    @connection = Connection.new
  end

  def index
    @connections = Connection.all.to_a
  end

  def show
    @connection = Connection.find(params[:id])
  end
end
