class NotesController < ApplicationController
  helper_method :notes, :note

  def index
    respond_to do |format|
      format.html {render text: "", layout: true}
      format.json {render json: notes }
    end
  end

  def create
    note = Note.create(note_params)
    respond_to do |format|
      format.json {render json: note }
    end
  end

  def update
    note.update_attributes(note_params)
    respond_to do |format|
      format.json {render json: note }
    end
  end

  def destroy
    respond_to do |format|
      format.json {render json: note.destroy }
    end
  end

  private

  def note_params
    params.permit(:title, :content)
  end

  def notes
    @_notes ||= Note.all
  end

  def note
    @_note ||= notes.find(params[:id])
  end
end
