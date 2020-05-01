class LinksController < ApplicationController

  def show
    @link = Link.where(shortSlug: params[:shortSlug]).first
    render 'errors/404', status: 404 if @link.nil?
    @link.update_attribute(:clicked, @link.clicked + 1)
    redirect_to school_path(@link.url)
  end
end