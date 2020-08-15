class SearchesController < ApplicationController
  
    def new 
        @user = User.find(params[:user_id])
        @search = @user.searches.build
    end
    
    def create 
        @search = Search.new(search_params)
        if @search.save 
            redirect_to user_searches_path(current_user)
        else
            render 'new'
        end
    end
    
    def index
        @searches = current_user.searches
    end
    
    def show
        
        @search = Search.find_by(id: params[:id])
        
        @users = []
        search_age(@search,@users)

        @users2 = @users
        @users = []
        search_blood(@users2,@users)
        
        @users2 = @users
        @users = []
        search_height(@users2, @users)

        
        

        
        
        
        logger.debug("search_controller show @user.count = #{@users.count}")
        
        
    end
    
    def edit
        @search = Search.find(params[:id])
        @user = User.find(params[:user_id])
    end


    def update 
        @search = Search.find(params[:id])
        if @search.update(search_params)
            redirect_to user_searches_path(current_user)
        else
            render 'edit'
        end
        
    end


    def destroy 
        @search = Search.find(params[:id])
        if @search.destroy
            redirect_to user_searches_path(current_user)
        else
            render 'edit'
        end
    end
    
    private
      def search_params
          params.require(:search).permit( {age:[] , blood: [], brother: [], prefecture_id: [], birthplace_id: [], money: [], height: []}, :study, :job, :user_id, :memo, :money).merge(user_id: current_user.id)
      end
      
      
      def search_age(search,users)
        if current_user.gender == "m"
            User.where(gender: "f").each do |user|
                if @search.age[0].to_i <= age_culc(user.birthday) && @search.age[1].to_i >= age_culc(user.birthday)
                    @users << user
                end
            end
        else
            User.where(gender: "m").each do |user|
                if @search.age[0].to_i <= age_culc(user.birthday) && @search.age[1].to_i >= age_culc(user.birthday)
                    @users << user
                end
            end            
        end
      end
      
      def search_blood(users2,users)
        users2.each do |user|
            if @search.blood.nil?
              logger.debug("------ nil")
                  users << user
            else
              @search.blood.each do |blood|
                if user.blood.downcase == blood
                  logger.debug("------ user.blood == blood ---#{blood}")
                  users << user
                end
              end
            end
        end
      end
      
      
      def search_height(users2,users)
        users2.each do |user|
          if @search.height[0].to_i <= user.stature && @search.height[1].to_i >= user.stature
            users << user
          end
        end
      end
    
 
end
