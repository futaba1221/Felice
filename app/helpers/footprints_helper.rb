module FootprintsHelper
    
    # 足跡をつけるメソッド
    def footprint(user)
        logger.debug("------------------------- FootprintsHelper")
        Footprint.create(visiter_id: current_user.id, visited_id: user.id)
    end
end
