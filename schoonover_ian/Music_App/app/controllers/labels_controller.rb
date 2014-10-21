class LabelsController < ApplicationController
	def index
    @labels = Label.all
  end

  def create
    @label = Label.create(label_params)
    redirect_to root_path
  end

  def new
    @label = Label.new
  end

   def edit
    @label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])

    if @label.update(label_params)
      redirect_to labels_path
   else
      render 'edit'
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy

    redirect_to labels_path
  end

  private
  def label_params
  	params.require(:label).permit(:name)
  end

end
