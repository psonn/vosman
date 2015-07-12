class EmailapiController < ApplicationController
  layout "front"

  def index
  end

  def subscribe

    @list_id = ENV["MAILCHIMP_LIST_ID"]
    gb = Gibbon::API.new

    gb.lists.subscribe({
      :id => @list_id,
      :email => {:email => params[:email][:address]}
      })
    respond_to do |format|
    format.html {redirect_to root_path}
    flash[:success] = "U bent succesvol ingeschreven voor de nieuwsbrief!"
    flash.keep(:alert) # Keep flash notice around for the redirect.
    format.js {render :js => "window.location.href='"+root_path+"'"} 
    end
  end
end