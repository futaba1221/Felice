module ApplicationHelper
    
    def new_like_to_me
        Relationship.where(followed_id: current_user.id, status: false)
    end
end
