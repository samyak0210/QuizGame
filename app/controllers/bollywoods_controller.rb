class BollywoodsController < ApplicationController
  before_action :set_bollywood, only: [:show, :edit, :update, :destroy]

  # GET /bollywoods
  # GET /bollywoods.json
  def index
    if current_user
      @bollywoods = Bollywood.all
      @lbd=Leaderboard.find_by_user_id(current_user.id)
      @lboard=Leaderboard.find_by_user_id(current_user.id)
      @bol=Leaderboard.order('maxb DESC')
      if @lbd.curb==Bollywood.count()
        @lbd.Bscore=0
        @lbd.curb=0
        @lbd.save
      end
    else
      redirect_to '/users/sign_in'
    end
  end

  # GET /bollywoods/1
  # GET /bollywoods/1.json
  def show
    @str=''
    @lbd=Leaderboard.find_by_user_id(current_user.id)
    @loc='/bollywoods/'+(Integer(params[:id])+1).to_s
    @lbd.curb=Integer(params[:id])
    if Integer(params[:id])==1
      @lbd.Bscore=0
    end
    @lbd.bollycheck = true
    @lbd.save
    if @bollywood
      if(params[:A])
        @str=@str+'A'
      end
      if(params[:B])
        @str=@str+'B'
      end
      if(params[:C])
        @str=@str+'C'
      end
      if(params[:D])
        @str=@str+'D'
      end
      if(@bollywood.MultiChoice == false)
        @str=params[:ans]
      end
      if(@str==@bollywood.correctans)
        @lbd.Bscore+=10
        @lbd.maxb=@lbd.maxb > @lbd.Bscore ? @lbd.maxb : @lbd.Bscore
        if @lbd.maxb > Bollywood.count()*10
          @lbd.maxb = Bollywood.count()*10
        end
        @lbd.save
      end
      if params[:A] or params[:B] or params[:C] or params[:D] or params[:ans]
        if Integer(params[:id])==Bollywood.count()
          redirect_to '/bollywoods/'
        else
          redirect_to @loc
        end
      end 
    else
      @lbd.Bscore=0
      @lbd.curb=0
      @lbd.save   
      redirect_to '/bollywoods/'
    end
  end

  # GET /bollywoods/new
  def new
    @bollywood = Bollywood.new
  end

  # GET /bollywoods/1/edit
  def edit
  end

  # POST /bollywoods
  # POST /bollywoods.json
  def create
    @bollywood = Bollywood.new(bollywood_params)

    respond_to do |format|
      if @bollywood.save
        format.html { redirect_to @bollywood, notice: 'Bollywood was successfully created.' }
        format.json { render :show, status: :created, location: @bollywood }
      else
        format.html { render :new }
        format.json { render json: @bollywood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bollywoods/1
  # PATCH/PUT /bollywoods/1.json
  def update
    respond_to do |format|
      if @bollywood.update(bollywood_params)
        format.html { redirect_to @bollywood, notice: 'Bollywood was successfully updated.' }
        format.json { render :show, status: :ok, location: @bollywood }
      else
        format.html { render :edit }
        format.json { render json: @bollywood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bollywoods/1
  # DELETE /bollywoods/1.json
  def destroy
    @bollywood.destroy
    respond_to do |format|
      format.html { redirect_to bollywoods_url, notice: 'Bollywood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bollywood
      # @lbd=Leaderboard.find_by_user_id(current_user.id)
      if Integer(params[:id])<=Bollywood.count
        @bollywood = Bollywood.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bollywood_params
      params.require(:bollywood).permit(:question, :o1, :o2, :o3, :o4, :correctans, :MultiChoice)
    end
end
