class AjaxTestsController < ApplicationController
  before_action :set_ajax_test, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  # GET /ajax_tests
  # GET /ajax_tests.json
  def index
    @ajax_tests = AjaxTest.all
    @new_ajax_test = AjaxTest.new
  end

  # GET /ajax_tests/1
  # GET /ajax_tests/1.json
  def show
  end

  # GET /ajax_tests/new
  def new
    @new_ajax_test = AjaxTest.new
  end

  # GET /ajax_tests/1/edit
  def edit
  end

  # POST /ajax_tests
  # POST /ajax_tests.json
  def create
    @ajax_test = AjaxTest.new(ajax_test_params)

    respond_to do |format|
      if @ajax_test.save
        format.html { redirect_to @ajax_test, notice: 'Ajax test was successfully created.' }
        format.json { render :show, status: :created, location: @ajax_test }
        format.js { render action: 'show', status: :created, location: @ajax_test }
      else
        format.html { render :new }
        format.json { render json: @ajax_test.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /ajax_tests/1
  # PATCH/PUT /ajax_tests/1.json
  def update
    respond_to do |format|
      if @ajax_test.update(ajax_test_params)
        format.html { redirect_to @ajax_test, notice: 'Ajax test was successfully updated.' }
        format.json { render :show, status: :ok, location: @ajax_test }
      else
        format.html { render :edit }
        format.json { render json: @ajax_test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ajax_tests/1
  # DELETE /ajax_tests/1.json
  def destroy
    @ajax_test.destroy
    respond_to do |format|
      format.html { redirect_to ajax_tests_url, notice: 'Ajax test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ajax_test
      @ajax_test = AjaxTest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ajax_test_params
      params.require(:ajax_test).permit(:name)
    end
end
