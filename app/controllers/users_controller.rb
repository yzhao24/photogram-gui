class UsersController < ApplicationController

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({:username => :asc })

    render({ :template => "user_templates/index" })
  end
  

  def show

    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    if @the_user == nil
      redirect_to("/404")
    else  
    render({ :template => "user_templates/show" })
    end
  end

  def update
    the_id = params.fetch("user_id")

    @the_user = User.where({:id => the_id}).at(0)

    @the_user.username = params.fetch("input_username")
    @the_user.save

    redirect_to("/users/" + @the_user.username )
  end  


  def create
    @the_user = User.new

    @the_user.username = params.fetch("query_username")

    @the_user.save

    redirect_to("/users")

  end




end  
