class Admin::CarriagesController < Admin::BaseController
	before_action :set_train, only: %i[new create]
	before_action :set_carriage, only: %i[show edit update]

	def new
		@carriage = Carriage.new
	end

	def show
	end

	def create
		@carriage = @train.carriages.new(carriage_params)
	    if @carriage.save
	      redirect_to admin_train_path(@train)
	    else
	      render :new
	    end
	end

	def edit

	end

	def update
	    if @carriage.update(carriage_params)
	      redirect_to admin_carriage_path(@carriage)
	    else 
	      render :edit
	    end
	end

    protected

    def set_train
    	@train = Train.find(params[:train_id])
    end

    def carriage_params
    	params.require(:carriage).permit(:number, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats)
    end

    def set_carriage
        @carriage = Carriage.find(params[:id])
    end
end