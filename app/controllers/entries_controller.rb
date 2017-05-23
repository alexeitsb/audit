class EntriesController < ApplicationController
  load_and_authorize_resource

  before_action :check_if_has_any, only: [:index]
  before_action :search_params, only: [:index]
  before_action { |controller| add_breadcrumb(controller.action_name) }

  def index
    @entries = last_entries
    @entries = @entries.send :by_responsible_id, params[:responsible_id] if params[:responsible_id].present?
    @entries = @entries.send :by_description, params[:description] if params[:description].present?
    @entries = @entries.send :by_beginning_date, params[:beginning_date] if params[:beginning_date].present?
    @entries = @entries.send :by_end_date, params[:end_date] if params[:end_date].present?
    @pag_entries = @entries.paginate(page: params[:page])
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
    p = params.require(:entry).permit(:responsible_id, :description, :value, :note, :entity, :at)
    p.merge!(user: current_user) if create?
    return p
  end

  def check_if_has_any
    render "templates/blank", locals: { text: "Seus Lançamentos aparecerão aqui", link_label: "fazer um lançamento", link_path: new_entry_path } if entries.empty?
  end

  def add_breadcrumb(action)
    if action == "index"
      breadcrumbs.add "Lançamentos"
    elsif action == "new" || action == "create"
      breadcrumbs.add "Lançamentos", entries_path
      breadcrumbs.add "Novo"
    elsif action == "show" || action == "edit" || action == "update"
      breadcrumbs.add "Lançamentos", entries_path
      breadcrumbs.add @entry.description
    end
  end

  def search_params
    @responsible_id = params[:responsible_id]
    @description = params[:description]
    @beginning_date = params[:beginning_date]
    @end_date = params[:end_date]
  end
end
