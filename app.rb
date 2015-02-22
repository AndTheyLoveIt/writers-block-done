require 'sinatra/base'

module ChatDemo
  class App < Sinatra::Base
    get "/" do
      erb :"home.html"
    end

    get "/chat" do

      prompts = ["The fight has been raging for three days. The teachers on their end, toting rulers, eraser canons and textbook grenades, and the students on the other, with only school-approved items found in their bookbags. Both sides have suffered casualties and people are wondering, what happened three days ago at Winston Waters High that started...", 
        "You take a sip from your drink and feel different. That may be because your torso has an extra arm protruding from it. Another sip, another arm. Then a wing. What happens if you finish the drink?",
        "During your trip to Turkey, you check into an old hotel. After settling yourself you notice a weathered chest in the corner. Upon opening it, war relics from the First World War and the Ottoman Empire lay before you. What stories do you find?",
        "Being a famous rock star is hard. Especially when an alien invasion hits mid-concert. As lasers and abductions abound, do you think your sick beats can stop this catastrophe? Write about how you attempted to fight off the aliens and whether or not you succeeded.",
        "Your family isn't cooperating with your writing career, so you've decided to go on strike. Write a list of demands that must be met in order for you to return to your chores and household responsibilities. (Don't forget to make a concession or two to speed up the negotiation process.)"]
      
      if params[:room]
        erb :"index.html", :locals => { :prompt => params[:room].to_i, :prompts => prompts }
      else
        erb :"index.html", :locals => { :prompt => false, :prompts => prompts }
      end
    end

    get "/assets/js/application.js" do
      content_type :js
      @scheme = ENV['RACK_ENV'] == "production" ? "wss://" : "ws://"
      erb :"application.js"
    end
  end
end
