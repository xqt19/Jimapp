class InstructionsController < ApplicationController
  def new
    @session = Session.find(params[:session_id])
    @instruction = Instruction.new
    @instruction.session = @session
  end

  def create
    new_instruction = Instruction.new(instruction_params)
    new_instruction.session = Session.find(params[:session_id])

    if new_instruction.save
      redirect_to session_path(new_instruction.session)
    else
      render :new
    end
  end

  def edit
    @instruction = Instruction.find(params[:id])
    @session = @instruction.session
  end

  def update
    @edited_instruction = Instruction.find(params[:id])
    if @edited_instruction.update(instruction_params)
      redirect_to session_path(@edited_instruction.session)
    else
      @session = @edited_instruction.session
      @instruction = @edited_instruction
      render :new
    end
  end

  def destroy
    @instruction = Instruction.find(params[:id])
    @instruction.destroy
    @session = Session.find(params[:session_id])
    redirect_to session_path(@session)
  end

  private

  def instruction_params
    params.require(:instruction).permit(:instruction, :exercise_id)
  end
end
