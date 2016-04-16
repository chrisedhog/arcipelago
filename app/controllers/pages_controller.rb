class PagesController < ApplicationController
     skip_before_action :authenticate_user!, 
    except: :admin
    
  def admin
      if current_user.has_role? :admin
          @users = User.all
          @group_categories = GroupCategory.all
#          @line_graph = User.group_by_day(:created_at, format: "%a %d%b", range: 1.year.ago.midnight..Time.now, time_zone: "Sydney")
          
      else
          redirect_to root_path
      end
  end

  def contact
      @enquiry = Enquiry.new
  end

  def about
  end
end
