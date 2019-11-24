class SessionsController < ApplicationController
  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
  end

  def new
    @new_session = Session.new
  end

  def create
    new_session = Session.new(session_params)

    if new_session.save
      redirect_to session_path(new_session)
    else
      render :new
    end
  end

  def edit
    @edited_session = Session.find(params[:id])
  end

  def update
    edited_session = Session.find(params[:id])
    if edited_session.update(session_params)
      redirect_to session_path(edited_session)
    else
      render :new
    end
  end

  def destroy
    del_session = Session.find(params[:id])
    del_session.destroy
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:name, :category, :completed, :deadline, :difficulty)
  end
end
