require 'mailgun'

class HomeController < ApplicationController
    def index
        
    end
    
    def write
        @almond = params[:title]
        @anchovy = params[:content]
        @cherry =params[:email]
        
        mg_client = Mailgun::Client.new("key-de0939b6952aec7d033598a225f126d7")

        message_params =  {
                   from: 'danielleyi92@gmail.com',
                   to:  @cherry ,
                   subject: @almond ,
                   text: @anchovy
                  }

        result = mg_client.send_message('sandboxaa4ad79388a447b3999c39ee9daab825.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
    end
end
