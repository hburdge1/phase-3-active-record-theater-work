class Role < ActiveRecord::Base
    has_many :auditions

        def actors
            self.auditions.map{|a| a.actor }
        end

        def locations
            self.auditions.map{|a| a.location }
        end

        def lead
         ifhired = self.auditions.find{|a| a.hired}
           if ifhired
                ifhired
           else 
            'no actor has been hired for this role'
           end
        end

        def understudy
            ifhired = self.auditions.filter{|a| a.hired}
            if ifhired.length > 1
                return ifhired[1]
            else
                 'no actor has been hired for understudy for this role'
            end
        end
        
end