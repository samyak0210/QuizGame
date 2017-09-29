class CricketsController < ApplicationController
  before_action :set_cricket, only: [:show, :edit, :update, :destroy]

  # GET /crickets
  # GET /crickets.json
  def index
    if not current_user
      redirect_to '/users/sign_in'
    else
      @crickets = Cricket.all
      @lbd=Leaderboard.find_by_user_id(current_user.id)
      @lboard=Leaderboard.find_by_user_id(current_user.id)
      @bol=Leaderboard.order('maxb DESC')
      if @lbd.curc==Cricket.count
        @lbd.Cscore=0
        @lbd.curc=0
        @lbd.save
      end
    end
    
  end

  # GET /crickets/1
  # GET /crickets/1.json
  def show
    @str=''
    @lbd=Leaderboard.find_by_user_id(current_user.id)
    @loc='/crickets/'+(Integer(params[:id])+1).to_s
    @lbd.curc=Integer(params[:id])
    if Integer(params[:id])==1
      @lbd.Cscore=0
    end
    @lbd.crikcheck = true
    @lbd.save
    if @cricket
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
      if @cricket.MultiChoice==false
        @str=params[:ans]
      end
      if(@str==@cricket.correctans)
        @lbd.Cscore+=10
        @lbd.maxc=@lbd.maxc > @lbd.Cscore ? @lbd.maxc : @lbd.Cscore
        if @lbd.maxc > (Cricket.count)*10
          @lbd.maxb = (Cricket.count)*10
        end
        @lbd.save
      end
      if params[:A] or params[:B] or params[:C] or params[:D] or params[:ans]
        if Integer(params[:id])==Cricket.count()
          redirect_to '/crickets/'
        else
          redirect_to @loc
        end
      end 
    else
      @lbd.Cscore=0
      @lbd.curc=0
      @lbd.save
      redirect_to '/crickets/'
    end
  end

  # GET /crickets/new
  def new
    @cricket = Cricket.new
  end

  # GET /crickets/1/edit
  def edit
  end

  # POST /crickets
  # POST /crickets.json
  def create
    @cricket = Cricket.new(cricket_params)

    respond_to do |format|
      if @cricket.save
        format.html { redirect_to @cricket, notice: 'Cricket was successfully created.' }
        format.json { render :show, status: :created, location: @cricket }
      else
        format.html { render :new }
        format.json { render json: @cricket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crickets/1
  # PATCH/PUT /crickets/1.json
  def update
    respond_to do |format|
      if @cricket.update(cricket_params)
        format.html { redirect_to @cricket, notice: 'Cricket was successfully updated.' }
        format.json { render :show, status: :ok, location: @cricket }
      else
        format.html { render :edit }
        format.json { render json: @cricket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crickets/1
  # DELETE /crickets/1.json
  def destroy
    @cricket.destroy
    respond_to do |format|
      format.html { redirect_to crickets_url, notice: 'Cricket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cricket
      if Integer(params[:id])<=Cricket.count
        @cricket = Cricket.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cricket_params
      params.require(:cricket).permit(:question, :o1, :o2, :o3, :o4, :correctans)
    end
end
