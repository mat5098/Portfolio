class PortfoliosController < ApplicationController
    def index
        @portfolio_item = Portfolio.all
    end
    
    def django
      @django_portfolio_item = Portfolio.django
    end

    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end
    def create
        @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body,
          technologies_attributes: [:name]))
    
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
          else
            format.html { render :new}
          end
        end
      end
    def edit
      @portfolio_item = Portfolio.find(params[:id])
    end
    def update
      @portfolio_item = Portfolio.find(params[:id])
      respond_to do |format|
        if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
          format.html { redirect_to portfolios_path, notice: "The record was successfully update." }
        else
          format.html { render :edit}
        end
      end
    end
    def show
      @portfolio_item = Portfolio.find(params[:id])
    end
    def destroy
      @portfolio_item = Portfolio.find(params[:id])
      @portfolio_item.destroy
      respond_to do |format|
        format.html { redirect_to portfolio_url, notice: "Record was successfully destroyed." }
      end
    end
  
end
