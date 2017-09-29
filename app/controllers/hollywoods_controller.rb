class HollywoodsController < ApplicationController
  before_action :set_hollywood, only: [:show, :edit, :update, :destroy]

  # GET /hollywoods
  # GET /hollywoods.json
  def index
    if current_user
      @hollywoods = Hollywood.all
      @lbd=Leaderboard.find_by_user_id(current_user.id)
      @lboard=Leaderboard.find_by_user_id(current_user.id)
      @bol=Leaderboard.order('maxb DESC')
      if @lbd.curh==Hollywood.count()
        @lbd.Hscore=0
        @lbd.curh=0
        @lbd.save
      end
    else
      redirect_to '/users/sign_in'
    end
  end

  # GET /hollywoods/1
  # GET /hollywoods/1.json
  def show
    @str=''
    @lbd=Leaderboard.find_by_user_id(current_user.id)
    @loc='/hollywoods/'+(Integer(params[:id])+1).to_s
    @lbd.curh=Integer(params[:id])
    if Integer(params[:id])==1
      @lbd.Hscore=0
    end
    @lbd.hollycheck = true
    @lbd.save
    if @hollywood
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
      if @hollywood.MultiChoice==false
        @str=params[:ans]
      end
      if(@str==@hollywood.correctans)
        @lbd.Hscore+=10
        @lbd.maxh=@lbd.maxh > @lbd.Fscore ? @lbd.maxf : @lbd.Fscore
        if @lbd.maxh > Hollywood.count()*10
          @lbd.maxh = Hollywood.count()*10
        end
        @lbd.save
      end
      if params[:A] or params[:B] or params[:C] or params[:D] or params[:ans]
        if Integer(params[:id])==Hollywood.count()
          redirect_to '/hollywoods/'
        else
          redirect_to @loc
        end
      end 
    else
      @lbd.Hscore=0
      @lbd.curh=0
      @lbd.save
      redirect_to '/hollywoods/'
    end
  end

  # GET /hollywoods/new
  def new
    @hollywood = Hollywood.new
  end

  # GET /hollywoods/1/edit
  def edit
  end

  # POST /hollywoods
  # POST /hollywoods.json
  def create
    @hollywood = Hollywood.new(hollywood_params)

    respond_to do |format|
      if @hollywood.save
        format.html { redirect_to @hollywood, notice: 'Hollywood was successfully created.' }
        format.json { render :show, status: :created, location: @hollywood }
      else
        format.html { render :new }
        format.json { render json: @hollywood.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hollywoods/1
  # PATCH/PUT /hollywoods/1.json
  def update
    respond_to do |format|
      if @hollywood.update(hollywood_params)
        format.html { redirect_to @hollywood, notice: 'Hollywood was successfully updated.' }
        format.json { render :show, status: :ok, location: @hollywood }
      else
        format.html { render :edit }
        format.json { render json: @hollywood.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hollywoods/1
  # DELETE /hollywoods/1.json
  def destroy
    @hollywood.destroy
    respond_to do |format|
      format.html { redirect_to hollywoods_url, notice: 'Hollywood was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hollywood
      if Integer(params[:id])<=Hollywood.count
        @hollywood = Hollywood.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hollywood_params
      params.require(:hollywood).permit(:question, :o1, :o2, :o3, :o4, :correctans, :MultiChoice)
    end
end
