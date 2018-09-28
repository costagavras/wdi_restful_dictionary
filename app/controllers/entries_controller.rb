class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
    render :show #can actually be removed bc default behaviour is to match method name to filename in views/entries
  end

  def new
    @new_entry = Entry.new
    render :new
  end

  def create
    @new_entry = Entry.new
    @new_entry.word = params[:entry][:word]
    @new_entry.definition = params[:entry][:definition]
    @new_entry.language = params[:entry][:language]
    @new_entry.save
    redirect_to entries_url
  end

  def edit
    @entry = Entry.find(params[:id])
    render :edit
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.word = params[:entry][:word]
    @entry.definition = params[:entry][:definition]
    @entry.language = params[:entry][:language]
    @entry.save
    redirect_to entry_url(params[:id])
   end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entries_path
  end
end
