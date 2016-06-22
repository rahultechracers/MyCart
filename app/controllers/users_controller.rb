class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end
  def update
     @user=User.find(params[:id])
     if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def destroy
    @user=User.find(params[:id])
    user.carts.destroy_all
    @user.destroy
    redirect_to users_path
  end

  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)

    if @user.save
      generate_cart(@user)
      redirect_to @user
    else
      render 'new'
    end
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :city, :state, :phone ,:password)
  end
  private
  def generate_cart(user)
    @cart = user.carts.create
  end
end
