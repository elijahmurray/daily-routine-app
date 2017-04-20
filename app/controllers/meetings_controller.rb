class MeetingsController < ApplicationController
  def new
    @connection = Connection.find(params[:connection_id])
    @meeting = Meeting.new
  end

  def create
    @connection = Connection.find(params[:connection_id])
    @meeting = @connection.meetings.build(meeting_params)
    if @meeting.save
      redirect_to connection_path(@connection)
    else
      render 'edit'
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @connection = @meeting.connection
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)
    if @meeting.save
      redirect_to connection_path(@meeting.connection)
    else
      render 'edit'
    end
  end

  private
  def meeting_params 
    params.require(:meeting).permit(:notes, :date)
  end
end
