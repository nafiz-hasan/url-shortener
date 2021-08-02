# frozen_string_literal: true

# handles basic database operations for url shortening
class AliasedLinksController < ApplicationController
  include UrlMessages

  before_action :set_aliased_link, except: %i[index show new create]
  before_action :set_aliased_link_by_token, only: :show

  def index
    @aliased_links = AliasedLink.unexpired
  end

  def show
    redirect_to root_path, notice: MESSAGES[:not_found] and return if @aliased_link.blank?

    if @aliased_link.link_expired?
      @aliased_link.destroy # Removing the expired link
      redirect_to root_path, notice: MESSAGES[:expired]
    else
      @aliased_link.infos.create(visitor_ip: request.remote_ip)
      redirect_to @aliased_link.long_url, status: :moved_permanently
    end
  end

  def new
    @aliased_link = AliasedLink.new
  end

  def create
    @aliased_link = AliasedLink.new(aliased_link_params.merge(creator_ip: request.remote_ip))

    if @aliased_link.save
      redirect_to root_path, notice: MESSAGES[:create_success]
    else
      render :new, alert: MESSAGES[:create_fail]
    end
  end

  def edit; end

  def update
    redirect_to root_path, alert: MESSAGES[:update_success] if @aliased_link.update(aliased_link_params)
  end

  def destroy
    redirect_to root_path, alert: MESSAGES[:delete_success] if @aliased_link.destroy
  end

  private

  def set_aliased_link
    @aliased_link = AliasedLink.find(params[:id])
  end

  def set_aliased_link_by_token
    @aliased_link = AliasedLink.find_by(token: params[:token])
  end

  def aliased_link_params
    params.require(:aliased_link).permit(:long_url, :custom_token)
  end
end
