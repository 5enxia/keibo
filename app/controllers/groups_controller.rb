class GroupsController < ApplicationController
    before_action :authenticate_user!

    def index
       @groups = Group.all
    end

    def new
        @group = Group.new
        @group << current_user
    end

    def create
        @group = Object.new(params[:group])
        if @group.save
          flash[:success] = "新しいグループが作成ました"
          redirect_to @group
        else
          flash[:error] = "入力に間違いがあります"
          render 'new'
        end
    end
    
   private
    def group_params
        params.require(:group).permit(:name, user_ids: [] )
    end
end
