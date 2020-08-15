module SearchesHelper
    
    def year_income(id)
        case id.to_i
        when 1 then
          "200万～400万"
        when 2 then
          "400万～600万"
        when 3 then
          "600万～800万"
        when 4 then
          "800万～1000万"
        when 5 then
          "1000万～1200万"
        when 6 then
          "1200万以上"  
        end
    end
    
    
    def prefecture_omission(prefecture)
        prefecture.delete("県").delete("府").delete("都")
    end
    
end
