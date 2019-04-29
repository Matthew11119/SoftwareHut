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

    def index_admin
        @undeployed = Exam.undeployed
        @deployed = Exam.deployed
        @completed = Exam.completed
        render 'exams/index'
    end

    def index_module_lead
        @exam_today = Exam.deployed.where("date = ?", [Time.now]).paginate(:page => params[:exam_today_page], :per_page => 5)
        @exam_upcoming = Exam.deployed.paginate(:page => params[:exam_upcoming_page], :per_page => 10)
        render 'exams/index_module_lead'
    end

    def index_moderator
        @exams = Exam.completed
        render 'exams/index_moderator'
    end
end
