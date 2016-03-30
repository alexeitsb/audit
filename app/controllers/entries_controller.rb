class EntriesController < ApplicationController
  load_and_authorize_resource

  before_action :check_if_has_any, only: [:index]

  def index
    @entries = last_entries.paginate(page: params[:page])
  end

  def new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to entries_path, notice: "#{@entry.description} - lançado com sucesso!"
    else
      render :new
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to entries_path, notice: "#{@entry.description} - atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_path, notice: "O lançamento foi excluído com sucesso!"
  end


  private

  def entry_params
    p = params.require(:entry).permit(:description, :value, :note, :entity, :at)
    p.merge!(user: current_user) if create?
    return p
  end

  def check_if_has_any
    render "templates/blank", locals: { text: "Seus Lançamentos aparecerão aqui", link_label: "fazer um lançamento", link_path: new_entry_path } if entries.empty?
  end
end
