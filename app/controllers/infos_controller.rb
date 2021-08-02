# frozen_string_literal: true

# we fetch the visit summary of a shortened URL
class InfosController < ApplicationController
  before_action :set_aliased_link

  def index
    @infos = @aliased_link.infos
  end

  private

  def set_aliased_link
    @aliased_link = AliasedLink.find_by(token: params[:token])
  end
end
