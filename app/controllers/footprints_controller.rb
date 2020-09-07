class FootprintsController < ApplicationController

    def index
      @footprints = []
      pre_footprint = nil
      
      @footprints_all = Footprint.where(visited_id: current_user.id).order(created_at: :desc).order(visiter_id: :desc)
      @footprints_all.each do |footprint|
        if @footprints.blank?
          @footprints << footprint
          pre_footprint = footprint
        else
          if pre_footprint.visiter_id != footprint.visiter_id
            logger.debug("====================== pre_footprint.id == footprint.id #{footprint.id}")
             @footprints << footprint
          else
            logger.debug("====================== pre_footprint.id != footprint.id #{footprint.id}")
          end
          pre_footprint = footprint
        end
      end
      
      # @footprints_all.each do |f| 
      #   unless @footprints.include?(f)
      #     @footprints << f
      #   end
        
      # end
    end


end
