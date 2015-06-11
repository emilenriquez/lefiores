class ApiController < ApplicationController
  #protect_from_forgery except: [:auth, :auth_verify, :me, :auth_facebook, :auth_twitter , :register_facebook]
  #protect_from_forgery except: :auth      
  

  #### search stores by zipcode
  def search_locations_by_zipcode    
    if params[:search] and params[:search].length > 1

      begin
        #location_title_inverted_index = Game::TitleInvertedIndex.new

        # if ! game_title_inverted_index.exists?
        #   # if there is no index in redis, it'll make new index          
        #   game_title_inverted_index.game_title_inverted_index
        # end

        # search from redis
        #game_ids = Game::TitleInvertedIndex.new.search(params[:search])
        #game_ids[0..9].each do |game_id|
          # use first 10 ids for find.
        #  begin
            # fetch from mongo
        #query = '/' + params[:search] + '/'
        zipcode = (params[:search])
        @locations = Location.any_of({ :zipcode => /.*#{zipcode}.*/ })
        #@locations = Location.any_of(:zipcode => "/#{query}/")#todo (like query) in mongodb                
        #@locations = Location.all
        #  end
        #end
      rescue err
        @locations = Location.all
      end
    end
  end
end