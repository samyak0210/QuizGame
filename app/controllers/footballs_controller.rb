class FootballsController < ApplicationController
  before_action :set_football, only: [:show, :edit, :update, :destroy]

  # GET /footballs
  # GET /footballs.json
  def index
    if current_user
      @footballs = Football.all
      @lbd=Leaderboard.find_by_user_id(current_user.id)
      @lboard=Leaderboard.find_by_user_id(current_user.id)
      @bol=Leaderboard.order('maxb DESC')
      if @lbd.curf==Football.count()
        @lbd.Fscore=0
        @lbd.curf=0
        @lbd.save
      end
    else
      redirect_to '/users/sign_in'
    end
  end

  # GET /footballs/1
  # GET /footballs/1.json
  def show
    @str=''
    @lbd=Leaderboard.find_by_user_id(current_user.id)
    @loc='/footballs/'+(Integer(params[:id])+1).to_s
    @lbd.curf=Integer(params[:id])
    if Integer(params[:id])==1
      @lbd.Fscore=0
    end
    @lbd.footcheck = true
    @lbd.save
    if @football
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
      if(@football.MultiChoice == false)
        @str=params[:ans]
      end
      if(@str==@football.correctans)
        @lbd.Fscore+=10
        @lbd.maxf=@lbd.maxf > @lbd.Fscore ? @lbd.maxf : @lbd.Fscore
        if @lbd.maxf > Football.count()*10
          @lbd.maxf = Football.count()*10
        end
        @lbd.save
      end
      if params[:A] or params[:B] or params[:C] or params[:D] or params[:ans]
        if Integer(params[:id])==Football.count()
          redirect_to '/footballs/'
        else
          redirect_to @loc
        end
      end 
    else
      @lbd.Fscore=0
      @lbd.curf=0
      @lbd.save
      redirect_to '/footballs/'
    end
  end

  # GET /footballs/new
  def new
    @football = Football.new
  end

  # GET /footballs/1/edit
  def edit
  end

  # POST /footballs
  # POST /footballs.json
  def create
    @football = Football.new(football_params)

    respond_to do |format|
      if @football.save
        format.html { redirect_to @football, notice: 'Football was successfully created.' }
        format.json { render :show, status: :created, location: @football }
      else
        format.html { render :new }
        format.json { render json: @football.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /footballs/1
  # PATCH/PUT /footballs/1.json
  def update
    respond_to do |format|
      if @football.update(football_params)
        format.html { redirect_to @football, notice: 'Football was successfully updated.' }
        format.json { render :show, status: :ok, location: @football }
      else
        format.html { render :edit }
        format.json { render json: @football.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /footballs/1
  # DELETE /footballs/1.json
  def destroy
    @football.destroy
    respond_to do |format|
      format.html { redirect_to footballs_url, notice: 'Football was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_football
      if Integer(params[:id])<=Football.count
        @football = Football.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def football_params
      params.require(:football).permit(:question, :o1, :o2, :o3, :o4, :correctans)
    end
end
