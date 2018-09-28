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
    redirect_to entries_url
  end

  def edit
    render :edit
  end

  def update
    redirect_to entry_url(params[:id])
  end

  def destroy
    redirect_to :index
  end
end
