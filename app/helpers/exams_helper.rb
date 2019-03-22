module ExamsHelper

    #un-deployed:0, deployed:1, completed:2, archive:3, template:4

    def status_string(status_num)
        if status_num == 0
            "Un-Deployed"
        elsif status_num == 1
            "Deployed"
        elsif status_num == 2
            "Completed"
        elsif status_num == 3
            "Archive"
        elsif status_num == 4
            "Template"  
        else
            "Error: status doesn't exist"
        end
    end
end
